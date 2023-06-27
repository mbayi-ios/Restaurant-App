//
//  Customer.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

struct Customer: Codable, Equatable {
    let customerId: Int
    var firstName: String
    var lastName: String
    var phone: String
    var isGuest: Bool
    var isVerified: Bool
    var isPhoneVerified: Bool
    var email: String
    var birthdate: String?
    
    func fullName() -> String {
        return firstName + " " + lastName
    }
    
    func phoneFormatted() -> String {
        return PhoneService.format(phone: phone)
    }
    
    static func == (lhs: Customer, rhs: Customer) -> Bool {
        return lhs.customerId == rhs.customerId &&
        lhs.firstName == rhs.firstName &&
        lhs.lastName == rhs.lastName &&
        lhs.phone == rhs.phone &&
        lhs.isGuest == rhs.isGuest &&
        lhs.isVerified == rhs.isVerified &&
        lhs.isPhoneVerified == rhs.isPhoneVerified &&
        lhs.email == rhs.email
    }
    
    
}
