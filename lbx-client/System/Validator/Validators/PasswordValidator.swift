//
//  PasswordValidator.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation
import SwiftUI

struct PasswordValidator: Validator {
    var value: String
    var title = String(localized: "Validator.Title.Password")
    
    var options: [ValidatorOption] =
    [
        ValidatorOptions.EmptyOption(),
        ValidatorOptions.EightCharacterOption(),
        ValidatorOptions.UppercaseCharacterOption(),
        ValidatorOptions.NumberCharacterOption(),
        ValidatorOptions.SpecialCharacterOption()
    ]
}
