//
//  CreateAccountModel.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation

class CreateAccountModel: ModelProtocol,ValidationForm {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var emailAddress: String = ""
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
    
    @Published var isEditingPassword: Bool = false
    
    var validators: [Validator] {
        [
            EmptyValidator(value: firstName, title: String("CreateAccountView.FieldTitle.FirstName")),
            EmptyValidator(value: lastName, title: String("CreateAccountView.FieldTitle.LastName")),
            EmailValidator(value: emailAddress),
            PhoneValidator(value: phoneNumber),
            PasswordValidator(value: password)
        ]
    }
}
