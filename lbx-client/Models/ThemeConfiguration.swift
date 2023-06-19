//
//  ThemeConfiguration.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 19/06/2023.
//

import Foundation
import SwiftUI

struct ThemeConfiguration {
    struct Settings {
        struct ThemeColors {
            let brand: String?
            let brandContrast: String?
            let accent: String?
            let background: String?
        }
        
        let themeColors: ThemeColors?
    }
    
    let settings: Settings?
                    
}
