//
//  GetCustomerMeRequest.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation

struct GetCustomerMeRequest: HTTPRequest {
    typealias Payload = GetCustomerMePayload
    typealias Response = GetCustomerMeResponse
    
    let path: HTTPEndpoint = NovadineEndpoint.customers_me
    let method = HTTPMethod.GET
    var body: Payload?
}
