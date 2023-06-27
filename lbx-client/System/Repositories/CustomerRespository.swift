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
    //private let locationSelectStore: LocationSelectStore
    
    private var customerId: String? {
        sessionStore.currentCustomer.value?.customerId.toString()
    }
    
    init(client: HTTPClient, sessionStore: SessionStore /*, locationSelectStore: LocationSelectStore*/) {
        self.client = client
        self.sessionStore = sessionStore
       // self.locationSelectStore = locationSelectStore
    }
    
    func setCustomerAuthorization(token: String) {
        sessionStore.storeCustomerAuthorization(token: token)
    }
    
    func setSessionToken(token: String) {
        sessionStore.storeSessionToken(token: token)
    }
    
    func authenticate(with taskModel: SignInTask.Model) -> AnyPublisher<Bool, Error> {
        let payload = PostSignInRequest.Payload(taskModel: taskModel)
        let request = PostSignInRequest(payload: payload)
        
        return client.perform(request)
            .receive(on: DispatchQueue.main)
            .tryMap { response in
                return true
            }
            .eraseToAnyPublisher()
    }
    
    func getCustomerMe() -> AnyPublisher<Bool, Error> {
        let request = GetCustomerMeRequest()
        
        return client.perform(request).tryMap { response in
            let customer = Customer(response: response)
            sessionStore.storeCurrentCustomer(customer)
            
            return true
        }.eraseToAnyPublisher()
    }
}
