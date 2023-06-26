//
//  SignInTask.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation
import Combine

struct SignInTask: TaskCombineInjectable {
    typealias RepositoryType = CustomerRepository
    typealias Model = SignInTaskModel
    typealias CombineResponse = Bool
    
    private let repository: RepositoryType
    
    init(repository: RepositoryType) {
        self.repository = repository
    }
    
    func execute(with object: Model) -> AnyPublisher<CombineResponse, Error> {
        return repository.authenticate(with: object)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
