//
//  DefaultKeyStore.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

struct DefaultKeyStore: KeyStore {
   
    func get(_ key: String) -> Any? {
        UserDefaults.standard.object(forKey: key)
    }
    
    func set(value: Any, for key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func clearValue(for key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
