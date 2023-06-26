//
//  SessionStore.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation
import Combine

struct SessionStore {
    
    
    private var keyStore: KeyStore
    
    init(keyStore: KeyStore) {
        self.keyStore = keyStore
    }
}
