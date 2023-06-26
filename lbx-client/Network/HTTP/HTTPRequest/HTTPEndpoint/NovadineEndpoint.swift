//
//  NovadineEndpoint.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

enum NovadineEndpoint: HTTPEndpoint {
    case customers_signin
    
    var base: String {
        return "/api/v2"
    }
    
    var location: String {
        switch self  {
        case .customers_signin:
            return "/customers/login"
        }
    }
    
    
}
