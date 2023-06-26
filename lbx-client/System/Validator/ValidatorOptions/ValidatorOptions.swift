//
//  ValidatorOptions.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 23/06/2023.
//

import Foundation

struct ValidatorOptions {
    struct EmptyOption: ValidatorOption {
        let type: ValidationType = .empty
        
        func isValid(_ value: String?) -> Bool {
            return !(value?.isEmpty ?? true)
        }
    }
}
