//
//  AlertMessage.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

struct AlertMessage: Equatable {
    static func == (lhs: AlertMessage, rhs: AlertMessage) -> Bool {
        return lhs.message == rhs.message && lhs.style == rhs.style
    }
    let message: String
    let style: AlertStyle
    var secondaryActionLabel: String = ""
    var isPrimaryActionEnabled: Bool = false
    var primaryAction: (() -> Void)? = nil
    var secondaryAction: (() -> Void)? = nil
}
