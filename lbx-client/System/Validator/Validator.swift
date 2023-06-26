//
//  Validator.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 23/06/2023.
//

import Foundation

protocol Validator {
    var value: String { get set }
    var title: String { get }
    var options: [ any ValidatorOption] { get }
    
    func invalidOptions() -> [any ValidatorOption]
    func isValid() -> Bool
    func localizedDescription() -> String?
    
}

extension Validator {
    func invalidOptions() -> [any ValidatorOption] {
        return options.filter { !$0.isValid(value) }
    }
    
    func isValid() -> Bool {
        return invalidOptions().isEmpty
    }
    
    func localizedDescription() -> String? {
        return invalidOptions().sorted(by: {
            $0.type.rawValue < $1.type.rawValue
        })
        .first?.reason(title: title)
    }
}


