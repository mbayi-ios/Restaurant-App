//
//  ThemeConfigurationState.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 22/06/2023.
//

import Foundation

class ThemeConfigurationState: ObservableObject {
    @Published private(set) var themeConfiguration: ThemeConfiguration?
    
}
