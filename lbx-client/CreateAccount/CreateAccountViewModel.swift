//
//  CreateAccountViewModel.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation
import SwiftUI
import Combine

class CreateAccountViewModel: ViewModelProtocol {
    @Environment(\.dependencies.tasks) var tasks
    @Environment(\.dependencies.state.sessionStore) var sessionStore
    
    @Published var model = CreateAccountModel()
    
    @Published var isVerifiedEmailPresented: Bool = false
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    func isSubmissionValid() -> Bool {
        return !model.containsEmptyValidators()
    }
    
    func handleSignUp() {
        guard isSubmissionValid() else {
            return
        }
        
        guard model.isValid() else {
            if let message = model.invalidValidators().first?.localizedDescription() {
                tasks.displayAlert(message: message, style: .error)
            }
            return
        }
        self.isLoading = true
        
        let taskModel = SignUpTask.Model(firstName: model.firstName,
                                         lastName: model.lastName,
                                         email: model.emailAddress,
                                         phone: model.phoneNumber,
                                         password: model.password,
                                         deviceToken: sessionStore.currentDeviceToken.value)
        
        let task = tasks.initialize(SignUpTask.self)
        
        task.execute(with: taskModel)
            .receive(on: DispatchQueue.main)
            .Subscriber(Subscribers.Sink(receiveCompletion: { response in
                self.isLoading = false
                switch response {
                case .finished:
                    withAnimation(.interactiveSpring()) {
                        self.isVerifiedEmailPresented = true
                    }
                    
                case .failure(let error):
                    if !self.tasks.displayAlert(error: error) {
                        self.error = error
                    }
                }
            }, receiveValue: { _ in }))
    }
    
    private func presentAlertMessage(_ message: String) {
        tasks.displayAlert(message: message, style:  .success)
    }
}
