//
//  ValidationOption.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 23/06/2023.
//

import Foundation

protocol ValidatorOption {
    var type: ValidationType { get }
    
    func reason(title: String) -> String
    func isValid(_ value: String?) -> Bool
    
    
}

extension ValidatorOption {
    func reason(title: String) -> String
    {
        return type.reason(title: title)
    }
    
    static func  == (lhs: any ValidatorOption, rhs: any ValidatorOption) -> Bool {
        return lhs.type == rhs.type
    }
}
