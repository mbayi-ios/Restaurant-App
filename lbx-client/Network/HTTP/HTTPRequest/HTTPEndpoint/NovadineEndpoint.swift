//
//  NovadineEndpoint.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

enum NovadineEndpoint: HTTPEndpoint {
    case customers_signin
    case customers_me
    
    var base: String {
        return "/api/v2"
    }
    
    var location: String {
        switch self  {
        case .customers_signin:
            return "/customers/login"
            
        case .customers_me:
            return "/customers/me"
        }
    }
    
    
}
