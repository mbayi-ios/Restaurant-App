//
//  GetCustomerMeTask.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation
import Combine

struct GetCustomerMeTask: TaskCombineNoninjectable {
    typealias RepositoryType = CustomerRepository
    typealias CombineResponse = Bool
    
    private let repository: RepositoryType
    
    init(repository: RepositoryType) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<CombineResponse, Error> {
        return repository.getCustomerMe()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
