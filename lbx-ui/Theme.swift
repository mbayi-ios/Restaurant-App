//
//  Theme.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 19/06/2023.
//

import Foundation
import SwiftUI

class Theme {
    var colors = Colors() 
    let icons: Icons = Icons()
    let typography: Typography = Typography() 
}

private struct ThemeKey: EnvironmentKey {
    static let defaultValue = Theme()
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set{ self[ThemeKey.self] = newValue }
    }
}

extension View {
    func theme(_ theme: Theme) -> some View {
        environment(\.theme, theme)
    }
}
