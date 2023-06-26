//
//  DisplayAlertMessageTask.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//
import Combine
import Foundation

struct DisplayAlertMessageTask: TaskInjectable {
    typealias Model = DisplayAlertMessageTaskModel
    typealias RepositoryType = AlertRepository
    
    private let repository : RepositoryType
    
    init(repository: RepositoryType) {
        self.repository = repository
    }
    
    func execute(with object: Model) {
        repository.storeAlertMessage(taskModel: object)
    }
}
