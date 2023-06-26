//
//  DisplayAlertMessageTaskModel.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

struct DisplayAlertMessageTaskModel {
    let alertMessage: AlertMessage
    
    init(message: String, style: AlertStyle, secondaryActionLabel: String = "", isPrimaryActionEnabled: Bool = false, primaryAction: (() -> Void)? = nil, secondaryAction: (() -> Void)? = nil) {
        alertMessage = AlertMessage(message: message, style: style, secondaryActionLabel: secondaryActionLabel, isPrimaryActionEnabled: isPrimaryActionEnabled, primaryAction: primaryAction, secondaryAction: secondaryAction)
    }
}
