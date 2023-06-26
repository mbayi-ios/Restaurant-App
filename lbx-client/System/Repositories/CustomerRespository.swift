//
//  CustomerRespository.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation
import Combine

struct CustomerRepository: Repository {
    private let client: HTTPClient
    private let sessionStore: SessionStore
    private let locationSelectStore: LocationSelectStore
    
    private var customerId: String? {
        sessionStore.currentCustomer.value?.customerId.toString()
    }
    
    init(client: HTTPClient, sessionStore: SessionStore, locationSelectStore: LocationSelectStore) {
        self.client = client
        self.sessionStore = sessionStore
        self.locationSelectStore = locationSelectStore
    }
}
