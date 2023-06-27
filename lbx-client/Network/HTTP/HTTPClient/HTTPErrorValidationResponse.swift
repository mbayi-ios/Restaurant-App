//
//  HTTPErrorValidationResponse.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

struct HTTPErrorValidationResponse: Decodable {
    struct ValidationError: Decodable {
        let param: String
        let location: String
        let message: String
    }
    
    let errors: [ValidationError]
}
