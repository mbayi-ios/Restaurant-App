//
//  Customer+GetCustomerMeResponse.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation

extension Customer {
    init(response: GetCustomerMeResponse) {
        self.customerId = response.customer_id
        self.firstName = response.first_name
        self.lastName = response.last_name
        self.phone = response.phone ?? ""
        self.isGuest = response.is_guest
        self.isVerified = response.is_verified
        self.isPhoneVerified = response.is_phone_verified ?? false
        self.email = response.email
        self.birthdate = response.birthdate
    }
}
