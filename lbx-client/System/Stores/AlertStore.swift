//
//  AlertStore.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation
import Combine

struct AlertStore {
    var messageForDisplay = CurrentValueSubject<AlertMessage?, Never>(nil)
    
    init () {
        clear()
    }
    
    func storeMessage(_ message: AlertMessage?) {
        messageForDisplay.send(message)
    }
    
    func clearMessage() {
        messageForDisplay.send(nil)
    }
    
    func clear() {
        clearMessage()
    }
}
