//
//  GetCustomerMeResponse.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation

struct GetCustomerMeResponse: Decodable {
    let customer_id: Int
    let first_name: String
    let last_name: String
    let phone: String?
    let is_guest: Bool
    let is_verified: Bool
    let is_phone_verified: Bool?
    let email: String
    let birthdate: String?
    
    let address1: String?
    let address2: String?
    let city: String?
    let state: String?
    let postal_code: String?
    let latitude: Float?
    let longitude: Float?
}
