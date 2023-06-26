//
//  Task.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation
import Combine

protocol Task {
    associatedtype RepositoryType: Repository
    
    init(repository: RepositoryType)
}

protocol TaskCombine {
    associatedtype CombineResponse
}

protocol TaskCombineNoninjectable: Task, TaskCombine {
    func execute() -> AnyPublisher<CombineResponse, Error>
}

protocol TaskModelInjectable: Task {
    associatedtype Model
}

protocol TaskInjectable: TaskModelInjectable {
    func execute(with object: Model)
}

protocol TaskCombineInjectable: TaskModelInjectable, TaskCombine {
    func execute(with object: Model) -> AnyPublisher<CombineResponse, Error>
}
