//
//  PhoneService.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation
import SwiftUI

class PhoneService {
    static func call(phoneNumber: String) {
        let phone = "tel://"
        let phoneNumberformatted = phone + phoneNumber
        
        guard let url = URL(string: phoneNumberformatted) else {
            return
        }
        
        UIApplication.shared.open(url)
    }
    
    static func format(phone phoneRaw: String) -> String {
        let phone = phoneRaw.removeSpaces()
        
        let result = phone.formatString(with: .phone)
        return result.formattedString
    }
}
