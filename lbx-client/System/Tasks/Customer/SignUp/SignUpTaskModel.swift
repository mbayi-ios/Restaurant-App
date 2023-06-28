//
//  SignUpTaskModel.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation

struct SignUpTaskModel {
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
    let password: String
    let deviceToken: String?
    
    
}

extension PostSignUpRequest.Payload {
    init(taskModel: SignUpTaskModel) {
        self.init(email: taskModel.email,
                  password: taskModel.password,
                  first_name: taskModel.firstName,
                  last_name: taskModel.lastName,
                  phone: taskModel.phone,
                  device_token: taskModel.deviceToken)
    }
}
