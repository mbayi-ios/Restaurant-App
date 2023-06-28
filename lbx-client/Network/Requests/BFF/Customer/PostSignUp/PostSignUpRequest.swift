//
//  PostSignUpRequest.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation

struct PostSignUpRequest: HTTPRequest {
    typealias Payload = PostSignInPayload
    typealias Response = PostSignUpResponse
    
    init(payload: Payload) {
        body = payload
    }
    
    let path: HTTPEndpoint = NovadineEndpoint.cutomers_signup
    let method = HTTPMethod.POST
    var body: Payload?
}
