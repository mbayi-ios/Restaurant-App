//
//  SignUpTask.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation
import SwiftUI
import Combine

struct SignUpTask: TaskCombineInjectable {
    typealias RepositoryType = CustomerRepository
    typealias Model = SignUpTaskModel
    typealias CombineResponse = Bool
    
    private let repository: RepositoryType
    
    init(repository: RepositoryType) {
        self.repository = repository
    }
    
    func execute(with object: Model) -> AnyPublisher<CombineResponse, Error> {
        return repository.signUp(with: object)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
