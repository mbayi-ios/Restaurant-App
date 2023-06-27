//
//  CustomerAuthTokenTask.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

struct CustomerAuthTokenTask: TaskInjectable {
    typealias RepositoryType = CustomerRepository
    typealias Model = String
    
    private let repository: RepositoryType
    
    init(repository: RepositoryType) {
        self.repository = repository
    }
    
    func execute(with object: Model) {
        repository.setCustomerAuthorization(token: object)
    }
}
