//
//  MessageError.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation

enum MessageError: LocalizedError {
    case message(String)
    
    var errorDescription: String? {
        return failureReason
    }
    
    var failureReason: String?
    {
        switch self {
        case .message:
            return String(localized: "Error.Reason.Error")
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .message(let message):
            return message
        }
    }
    
    var helpAnchor: String?
    {
        return nil
    }
}
