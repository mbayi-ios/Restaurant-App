//
//  ThemeConfiguration.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 19/06/2023.
//

import Foundation
import SwiftUI

struct ThemeConfiguration: Codable, Identifiable, Equatable {
    struct Settings: Codable, Equatable {
        struct ThemeColors: Codable, Equatable {
            let brand: String?
            let brandContrast: String?
            let accent: String?
            let background: String?
        }
        
        let themeColors: ThemeColors?
        
        struct HubMarketing: Codable, Equatable {
            let image: String?
            let title: String?
            let buttonURL: String?
            let buttonText: String?
            let description: String?
        }
        
        struct HomeCarousel: Codable, Equatable {
            let imageUrl: String?
        }
        
        let homeCarousel: [HomeCarousel]?
        let hubMarketing: [HubMarketing]?
    }
    var id: String {
        return tenantId
    }
    
    let tenantId: String
    let settings: Settings?
                    
}
