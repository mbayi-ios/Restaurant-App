//
//  SignInViewModel.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 23/06/2023.
//

import Foundation
import SwiftUI
import Combine

class SignInViewModel: ViewModelProtocol {
    @Environment(\.dependencies.tasks) var tasks
    @Environment(\.dependencies.state.sessionStore) var sessionStore
    
    @Published var model = SignInModel()
    
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    var dismissalPublisher = PassthroughSubject<Bool, Never>()
    
    private var shouldDismissView = false {
        didSet {
            dismissalPublisher.send(shouldDismissView)
        }
    }
    
    func isSubmissionValid() -> Bool {
        return !model.containsEmptyValidators()
    }
    
    func handleSignIn() {
        guard isSubmissionValid() else {
            return
        }
        
        guard model.isValid()  else {
            if let message = model.invalidValidators().first?.localizedDescription() {
                tasks.displayAlert(message: message, style: .error)
            }
            
            return
        }
        
        isLoading = true
        
        let taskModel = SignInTask.Model(email: model.email, password: model.password, deviceToken: sessionStore.currentDeviceToken.value)
        
        let task = tasks.initialize(SignInTask.self)
        
        return task.execute(with: taskModel)
            .receive(on: DispatchQueue.main)
            .subscribe(Subscribers.Sink(receiveCompletion: { response in
                
                switch response {
                case .finished:
                    break
                    
                case .failure(let error):
                    self.isLoading  = false
                    
                    if !self.tasks.displayAlert(error: error) {
                        self.error = error
                    }
                }
                
            }, receiveValue: { signInResponse in
                self.getCustomerMe()
            }))
    }
    
    func getCustomerMe() {
        self.isLoading = true
        
        let task = tasks.initialize(GetCustomerMeTask.self)
        
        return task.execute()
            .receive(on: DispatchQueue.main)
            .subscribe(Subscribers.Sink(receiveCompletion: { response in
                self.isLoading = false
                
                switch response {
                case .finished:
                    self.shouldDismissView = true
                    
                case .failure(let error):
                    if !self.tasks.displayAlert(error: error) {
                        self.error = error
                    }
                }
            }, receiveValue: { _ in }))
    }
}
