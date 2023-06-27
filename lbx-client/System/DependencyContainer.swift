//
//  DependencyContainer.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation
import SwiftUI
import Combine

struct DependencyContainer: EnvironmentKey {
    let tasks: Tasks
    let state: AppState
    
    static var defaultValue: Self { Self.default }
    
    private static var `default`: Self = {
        let keyStore = DefaultKeyStore()
        let sessionStore = SessionStore(keyStore: keyStore)
        let themeConfigurationStore = ThemeConfigurationStore()
        
        let repositories = Repositories()
        
        return Self(
            tasks: Tasks(repositories: repositories),
            state: AppState(themeConfigurationStore: themeConfigurationStore, sessionStore: sessionStore)
        )
    }()
}

extension EnvironmentValues {
    var dependencies: DependencyContainer  {
        get { self[DependencyContainer.self ] }
        set { self[DependencyContainer.self] = newValue }
    }
}
