//
//  EmailValidator.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation
import SwiftUI

struct EmailValidator: Validator {
    var value: String
    var title = String(localized: "Validator.Title.Email")
    
    var options: [ValidatorOption] =
    [
        ValidatorOptions.EmptyOption(),
        ValidatorOptions.EmailFormatOption()
    ]
}
