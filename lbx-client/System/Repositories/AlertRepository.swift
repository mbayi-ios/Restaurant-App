//
//  AlertRepository.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

class AlertRepository: Repository, ObservableObject {
    private let store: AlertStore
    
    init(store: AlertStore) {
        self.store = store
    }
    
    func storeAlertMessage(taskModel: DisplayAlertMessageTask.Model) {
        store.storeMessage(taskModel.alertMessage)
    }
    
    func clearAlerts() {
        store.clear()
    }
}
