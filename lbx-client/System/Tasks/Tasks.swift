//
//  Tasks.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation


struct Tasks {
    private let repositories: Repositories
    
    init(repositories: Repositories) {
        self.repositories = repositories
    }
    
    func initialize<T: Task>(_ type: T.Type) -> T {
        let repository = repositories.resolve(T.RepositoryType.self)
        return T(repository: repository)
    }
    
    func displayAlert(message: String, style: AlertStyle, secondaryActionLabel: String = "", isPrimaryActionEnabled: Bool = false, primaryAction: (() -> Void)? = nil, secondaryAction: (() -> Void)? = nil) {
        
        let taskModel = DisplayAlertMessageTask.Model(message: message.extractJSONError(), style: style, secondaryActionLabel: secondaryActionLabel, isPrimaryActionEnabled: isPrimaryActionEnabled, primaryAction: primaryAction, secondaryAction: secondaryAction)
        
        let task = initialize(DisplayAlertMessageTask.self)
        
        task.execute(with: taskModel)
    }
}
