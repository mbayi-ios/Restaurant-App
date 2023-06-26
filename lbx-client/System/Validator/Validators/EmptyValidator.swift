//
//  EmptyValidator.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 23/06/2023.
//

import Foundation

struct EmptyValidator: Validator {
    var value: String
    var title: String
    
    var options: [ValidatorOption] = [
        ValidatorOptions.EmptyOption()
    ]
}
