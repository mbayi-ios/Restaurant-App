//
//  HTTPClient.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation
import Combine
import SwiftUI

protocol NetworkClient {
    func perform<Request: HTTPRequest>(_ request: Request) -> AnyPublisher<Request.Response, Error>
}


class HTTPClient: NetworkClient {
    
    @Environment(\.dependencies.tasks) var tasks
    
    private static let bffAuthTokenName = "__ac"
    private static let sessionTokenName = "NovaDine.session"
    private static let badRequestHttpStatusCode = 400
    
    private let context: HTTPMessageContextual
    private let session: URLSession
    private let encoder = HTTPClientEncoder()
    private let decoder = HTTPClientDecoder()
    
    init(context: HTTPMessageContextual, session: URLSession = URLSession(configuration: .default)) {
        self.context = context
        self.session = session
    }
    
    func perform<Request: HTTPRequest>(_ request: Request) -> AnyPublisher<Request.Response, Error> {
        var components = URLComponents()
        components.path = request.path.endpoint
        
        if let queryItems = (request as? HTTPRequestQueryItems)?.queryItems,
           !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        
        guard let baseUrl = context.hostUrl,
              let url = components.url(relativeTo: baseUrl) else {
            return Fail(error: HTTPClientError.invalidBaseUrl).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        var headers = context.headers
        
        if let requestHeaders = (request as? HTTPRequestHeaders)?.headers {
            headers = headers.merging(requestHeaders, uniquingKeysWith: { (_, new) in new})
        }
        
        urlRequest.allHTTPHeaderFields = headers
        
        if let httpBody = request.body {
            do {
                urlRequest.httpBody = try encoder.encode(httpBody)
            } catch {
                return Fail(error: HTTPClientError.invalidBody).eraseToAnyPublisher()
            }
        }
        session.getAllTasks { tasks in
            if let task = tasks.first(where: {
                $0.originalRequest?.url == urlRequest.url &&
                $0.originalRequest?.httpMethod == urlRequest.httpMethod
            })
            {
                task.cancel()
            }
        }
        
        urlRequest.cUrlLogDebug()
        
        return perform(urlRequest)
            .decode(type: Request.Response.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    private func perform(_ request: URLRequest) -> AnyPublisher<Data, Error> {
        session.dataTaskPublisher(for: request)
            .tryMap { (data, response ) -> Data in
                guard let httpResponse = response as? HTTPURLResponse  else {
                    throw HTTPClientError.unknown(statusCode: HTTPClient.badRequestHttpStatusCode, data: data)
                }
                
                if let headers = httpResponse.allHeaderFields as? [String: String],
                   let url = response.url {
                    let cookies = HTTPCookie.cookies(withResponseHeaderFields: headers, for: url)
                    
                    if let authCookie = cookies.first(where: {$0.name == HTTPClient.bffAuthTokenName}) {
                        let task = self.tasks.initialize(CustomerAuthTokenTask.self)
                        task.execute(with: "\(authCookie.name) = \(authCookie.value)")
                    }
                    
                    if let sessionCookie = cookies.first(where: {$0.name == HTTPClient.sessionTokenName }){
                        let task = self.tasks.initialize(SessionTokenTask.self)
                        task.execute(with: "\(sessionCookie.name) = \(sessionCookie.value)")
                    }
                }
                
                let statusCode = httpResponse.statusCode
                
                guard 200..<300 ~= statusCode else {
                    if let errorResponse = try? self.decoder.decode(HTTPErrorValidationResponse.self, from: data) {
                        throw HTTPClientError.validation(statusCode: statusCode, response: errorResponse)
                    }
                    if let errorResponse = try? self.decoder.decode(HTTPErrorMessageResponse.self, from: data) {
                        throw HTTPClientError.message(statusCode: statusCode, response: errorResponse)
                    }
                    
                    if let message = String(data: data, encoding: .utf8) {
                        if(self.isHtmlString(message)) {
                            throw HTTPClientError.unknown(statusCode: statusCode, data: data)
                        } else  {
                            let errorResponse = HTTPErrorMessageResponse(message: message)
                            throw HTTPClientError.message(statusCode: statusCode, response: errorResponse)
                        }
                    }
                    throw HTTPClientError.unknown(statusCode: statusCode, data: data)
                }
                
                return data
            }
            .eraseToAnyPublisher()
    }
    
    func isHtmlString(_ value: String) -> Bool {
        if value.isEmpty {
            return false
        }
        
        return (value.range(of: "<(\"[^\"]*\"|'[^']*'|[^'\">])*>", options: .regularExpression) != nil)
    }
}
