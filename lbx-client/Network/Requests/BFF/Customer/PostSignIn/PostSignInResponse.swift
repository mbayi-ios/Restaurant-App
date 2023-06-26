//
//  PostSignInResponse.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

struct PostSignInResponse: Decodable {
    let customer_id: Int
    let auth_cookie: String 
}
