//
//  Repositories.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation


class Repositories {
    private var repositories = [String: Repository]()
    
    func register<R: Repository>(_ repository: R) {
        repositories["\(R.self)"] = repository
        
    }
    
    func resolve<R: Repository>(_ resitoryType: R.Type) -> R {
        guard let repository = repositories["\(R.self)"] as? R else {
            fatalError("Attempting to access a repository that hasn't been registered inside DependencyContainer.")
        }
        
        return repository
    }
}
