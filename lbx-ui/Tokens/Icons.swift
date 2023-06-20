//
//  Icons.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 19/06/2023.
//

import Foundation
import SwiftUI

struct Icons {
    let system = System()
    let base = Base()
    let walkthrough = Walkthrough()
    
    struct System {
        let eyeFill = Image(systemName: "eye.fill")
        let eyeSlashFill = Image(systemName: "eye.slash.fill")
    }
    
    struct Walkthrough {
        let notifications = Image("WalkthroughNotifications")
    }
    
    struct Base {
        let brand = Image("Brand")
    }
}
