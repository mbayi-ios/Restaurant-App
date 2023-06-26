//
//  SignInModel.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 23/06/2023.
//

import Foundation

class SignInModel: ModelProtocol, ValidationForm {

    
    @Published var email: String = ""
    @Published var password: String = ""
    
    var validators: [Validator] {
        [
         EmptyValidator(value: email, title: String(localized: "SignInView.FieldTitle.EmailAddress")),
         EmptyValidator(value: password, title: String(localized: "SignInView.FieldTitle.Password"))
        ]
    }
}
