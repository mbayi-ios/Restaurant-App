//
//  View+Alert.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation
import SwiftUI

extension View {
    func errorAlert(error: Binding<Error?>, buttonTitle: String = String(localized: "Alert.Label.Ok")) -> some View {
        let localizedAlertError = LocalizedAlertError(error: error.wrappedValue)
        
        return alert(localizedAlertError?.failureReason ?? String(localized: "Error.Reason.Error"),
                     isPresented: .constant(localizedAlertError != nil),
                     presenting: localizedAlertError) { _ in
            Button(buttonTitle) {
                error.wrappedValue = nil
            }
            
        } message: { error in
            Text(error.recoverySuggestion ?? String(localized: "Error.Suggestion.PleaseTryAgain"))
        }
    }
}
