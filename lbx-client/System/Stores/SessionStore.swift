//
//  SessionStore.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation
import Combine

struct SessionStore {
    
    private static let customerAuthorizationKey = "customer_authorization_key"
    private static let sessionKey = "session_key"
    
    
    private var keyStore: KeyStore
    
    var currentCustomer = CurrentValueSubject<Customer?, Never>(nil)
    var currentAuthToken = CurrentValueSubject<String?, Never>(nil)
    var currentSessionToken = CurrentValueSubject<String?, Never>(nil)
    var currentDeviceToken = CurrentValueSubject<String?, Never>(nil)
    
    init(keyStore: KeyStore) {
        self.keyStore = keyStore
    }
    
    func storeCustomerAuthorization(token: String) {
        keyStore.set(value: token, for: SessionStore.customerAuthorizationKey)
        
        currentAuthToken.send(token)
    }
    
    func storeSessionToken(token: String) {
        keyStore.set(value: token, for: SessionStore.sessionKey)
        
        currentSessionToken.send(token)
    }
    
    func storeCurrentCustomer(_ customer: Customer) {
        guard let encodedCustomer = try? JSONEncoder().encode(customer) else {
            return
        }
    }
}
