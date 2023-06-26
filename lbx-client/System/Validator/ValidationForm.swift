//
//  ValidationForm.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 23/06/2023.
//

import Foundation

protocol ValidationForm {
    var validators: [Validator] { get }
    
    func isValid() -> Bool
    func invalidValidators() -> [Validator]
    func containsEmptyValidators() -> Bool
}

extension ValidationForm {
    func isValid() -> Bool {
        return invalidValidators().isEmpty
    }
    
    func invalidValidators() -> [Validator] {
        return validators.filter {!$0.isValid()}
    }
    
    func containsEmptyValidators() -> Bool {
        let emptyValidators = invalidValidators().filter({ validator in
            validator.invalidOptions().contains(where: { option in
                option.type == .empty
            })
        })
        
        return !emptyValidators.isEmpty
    }
}
