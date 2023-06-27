//
//  HTTPClient+Error.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

extension HTTPClient {
    enum HTTPClientError: LocalizedError {
        case unknown(statusCode: Int, data: Data)
        case invalidBaseUrl
        case invalidBody
        case validation(statusCode: Int, response: HTTPErrorValidationResponse)
        case message(statusCode: Int, response: HTTPErrorMessageResponse)
        
        var errorDescription: String? {
            switch self {
            case .unknown, .invalidBaseUrl, .invalidBody:
                return "failureReason"
                
            case .validation(let statusCode, _), .message(let statusCode, _):
                return "\(statusCode): \(failureReason ?? ""). \(recoverySuggestion ?? "")"
            }
        }
        
        var failureReason: String? {
            switch self {
            case .unknown( let statusCode, _):
                return String(localized: "Error.Reason.AnErrorOccured")
                
            case .invalidBaseUrl:
                return String(localized: "Error.Reason.InvalidBaseUrl")
                
            case .invalidBody:
                return String(localized: "Error.Reason.InvalidBody")
                
            case .validation:
                return String(localized: "Error.Reason.Invalid")
                
            case .message:
                return String(localized: "Error.Reason.Error")
            }
        }
        
        var recoverySuggestion: String? {
            switch self {
            case .unknown:
                return String(localized: "Error.Suggestion.PleaseTryAgain")
                
            case .invalidBaseUrl:
                return String(localized: "Error.Suggestion.MessageContext")
                
            case .invalidBody:
                return String(localized: "Error.Suggestion.RequestBody")
                
            case .validation(_, let response):
                guard !response.errors.isEmpty,
                      let firstError = response.errors.first else {
                    return String(localized: "Error.Suggestion.FieldsInvalid")
                }
                
                guard response.errors.count >= 1 else {
                    return firstError.message
                }
                
                let reason = response.errors.map { $0.message}
                    .joined(separator: String(localized: "Error.Suggestion.ValidationSeparator"))
                return "\(String(localized: "Error.Suggestion.Validation"))\(reason)"
                
            case .message(_, let response):
                return response.message
            }
        }
        
        var helpAnchor: String?
        {
            return nil
        }
    }
}
