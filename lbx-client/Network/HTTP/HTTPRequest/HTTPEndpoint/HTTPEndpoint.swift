//
//  HTTPEndpoint.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

protocol HTTPEndpoint {
    var base: String { get }
    var location: String { get }
    
    
}

extension HTTPEndpoint {
    var endpoint: String {
        return "\(base)\(location)"
    }
}
