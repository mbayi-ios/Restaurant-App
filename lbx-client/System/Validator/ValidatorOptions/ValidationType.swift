//
//  ValidationType.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 23/06/2023.
//

import Foundation

enum ValidationType: Int {
    case empty
    case sixCharacters
    case eightCharacters
    case uppsercaseCharacter
    case numberCharacter
    case specialCharacter
    case phoneNumberLength
    case emailFormat
    
    func reason(title: String) -> String {
        switch self {
        case .empty:
            return "\(title ) \(String(localized: "Validator.Reason.Empty"))"
        case .sixCharacters:
            return "\(title) \(String(localized: "Validator.Reason.SixCharacters"))"
        case .eightCharacters:
            return "\(title) \(String(localized: "Validator.Reason.EightCharacters"))"
        case .uppsercaseCharacter:
            return "\(title) \(String(localized: "Validator.Reason.UppercaseCharacter"))"
        case .numberCharacter:
            return "\(title) \(String(localized: "Validator.Reason.NumberCharacter"))"
        case .specialCharacter:
            return "\(title) \(String(localized: "Validator.Reason.SpecialCharacter"))"
        case .phoneNumberLength:
            return "\(title) \(String(localized: "Validator.Reason.phoneNumberLength"))"
        case .emailFormat:
            return "\(title) \(String(localized: "Validator.Reason.EmailFormat"))"
        }
    }
}
