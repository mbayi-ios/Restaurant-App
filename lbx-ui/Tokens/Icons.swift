//
//  Icons.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 19/06/2023.
//

import Foundation
import SwiftUI

struct Icons {
    let base = Base()
    let walkthrough = Walkthrough()
    
    struct Walkthrough {
        let notifications = Image("WalkthroughNotifications")
    }
    
    struct Base {
        let brand = Image("Brand")
    }
}
