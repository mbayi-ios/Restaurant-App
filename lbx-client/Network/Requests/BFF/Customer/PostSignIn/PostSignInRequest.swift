//
//  PostSignInRequest.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

struct PostSignInRequest: HTTPRequest {
    typealias Payload =  PostSignInPayload
    typealias Response = PostSignInResponse
    
    init(payload: Payload){
        body = payload
    }
    
    let path: HTTPEndpoint = NovadineEndpoint.customers_signin
    let method = HTTPMethod.POST
    var body: Payload?
    
}
