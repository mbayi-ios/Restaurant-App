//
//  ThemeConfigurationStore.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//
import Combine
import Foundation

struct ThemeConfigurationStore {
    private static let themeConfigurationKey = "client_configuration"
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    var themeConfiguration = CurrentValueSubject<ThemeConfiguration?, Never>(nil)
    
    init() {
        themeConfiguration.send(storedThemeConfiguration())
    }
    
    func storeThemeConfiguration(_ configuration: ThemeConfiguration?) {
        guard configuration != nil, let data = try? encoder.encode(configuration) else {
            UserDefaults.standard.removeObject(forKey: ThemeConfigurationStore.themeConfigurationKey)
            
            themeConfiguration.send(nil)
            
            return
        }
        
        UserDefaults.standard.set(data, forKey: ThemeConfigurationStore.themeConfigurationKey)
        
        themeConfiguration.send(configuration)
    }
    
    private func storedThemeConfiguration() -> ThemeConfiguration? {
        guard let data = UserDefaults.standard.data(forKey: ThemeConfigurationStore.themeConfigurationKey),
              let configuration = try? decoder.decode(ThemeConfiguration.self, from: data) else {
            return nil
        }
        
        return configuration
    }
    
    func clear() {
        themeConfiguration.send(nil)
    }
}
