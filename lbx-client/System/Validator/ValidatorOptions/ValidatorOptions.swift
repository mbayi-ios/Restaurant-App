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
    
    struct UppercaseCharacterOption: ValidatorOption {
        let type: ValidationType = .uppsercaseCharacter
        
        func isValid(_ value: String?) -> Bool {
            return value?.rangeOfCharacter(from: .uppercaseLetters) != nil
        }
    }
    
    struct SixCharactersOption: ValidatorOption {
        let type: ValidationType = .sixCharacters
        
        func isValid(_ value: String?) -> Bool {
            return (value?.count ?? 0) >= 6
        }
    }
    
    struct EightCharacterOption: ValidatorOption {
        let type: ValidationType = .eightCharacters
        
        func isValid(_ value: String?) -> Bool {
            return (value?.count ?? 0) >= 8
        }
    }
    
    struct PhoneNumberLengthOption: ValidatorOption {
        let type: ValidationType = .phoneNumberLength
        
        func isValid(_ value: String?) -> Bool {
            guard let value = value, !value.isEmpty else {
                return false
            }
            
            return value.filter("0123456789".contains).count >= 10
        }
    }
    
    struct EmailFormatOption: ValidatorOption {
        let type: ValidationType = .emailFormat
        
        func isValid(_ value: String?) -> Bool {
            guard let value = value else {
                return false
            }
            
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
            
            return emailPredicate.evaluate(with: value)
        }
    }
    
    struct NumberCharacterOption: ValidatorOption {
        let type: ValidationType = .numberCharacter
        
        func isValid(_ value: String?) -> Bool {
            return value?.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
        }
    }
    
    struct SpecialCharacterOption: ValidatorOption {
        let type: ValidationType = .specialCharacter
        
        func isValid(_ value: String?) -> Bool {
            let specialCharacters = CharacterSet.alphanumerics.inverted
            
            return value?.rangeOfCharacter(from: specialCharacters) != nil
        }
    }
}
