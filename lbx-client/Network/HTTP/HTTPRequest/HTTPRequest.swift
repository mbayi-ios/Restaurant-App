//
//  HTTPRequest.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

protocol HTTPRequest {
    associatedtype Payload: Encodable
    associatedtype Response: Decodable
    
    var method: HTTPMethod { get }
    var path: HTTPEndpoint { get }
    var body: Payload? { get }
}
