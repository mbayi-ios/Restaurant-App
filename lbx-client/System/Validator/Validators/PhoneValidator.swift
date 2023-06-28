//
//  PhoneValidator.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation

struct PhoneValidator: Validator {
    var value: String
    var title = String(localized: "Validator.Title.PhoneNumber")
    
    var options: [ValidatorOption] =
    [
        ValidatorOptions.EmptyOption(),
        ValidatorOptions.PhoneNumberLengthOption()
    ]
}
