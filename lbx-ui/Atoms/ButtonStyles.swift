//
//  ButtonStyles.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 19/06/2023.
//

import Foundation
import SwiftUI

extension Button {
    func primary() -> some View {
        buttonStyle(BorderedFilled(.primary))
    }
    
    func secondaryOnPrimary() -> some View {
        buttonStyle(BorderedFilled(.secondaryOnPrimary))
    }
    
    func subduedOnPrimary() -> some View {
        buttonStyle(BorderedFilled(.subduedOnPrimary))
    }
    
    func link() -> some View {
        buttonStyle(Link(isBold: false))
    }
    
    func criticalLink() -> some View {
        buttonStyle(CriticalLink())
    }
}

private struct CriticalLink: ButtonStyle {
    @Environment(\.theme) var theme: Theme
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .foregroundColor(theme.colors.textCriticalSecondary)
            .font(theme.typography.buttonLinkBold)
    }
}

private struct Link: ButtonStyle {
    @Environment(\.theme) var theme: Theme
    
    let isBold: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .foregroundColor(theme.colors.actionPrimary)
            .font(isBold ? theme.typography.buttonLinkBold : theme.typography.buttonLink)
    }
}

private struct BorderedFilled: ButtonStyle {
    @Environment(\.theme) var theme: Theme
    @Environment(\.isEnabled) private var isEnabled
    
    init(_ style: Style) {
        self.style = style
    }

    enum Style {
        case primary
        case secondary
        case secondaryOnPrimary
        case subdued
        case subduedOnPrimary
        case critical
    }
    
    private let style: Style
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let onFill: Color
        let fill: Color
        let fillPressed: Color
        let border: Color
        
        switch(style, isEnabled) {
        case (.primary, true):
            onFill = theme.colors.textOnPrimary
            fill = theme.colors.actionPrimary
            fillPressed = theme.colors.actionPrimaryPressed
            border = theme.colors.borderActionPrimary
            
        case (.primary, false):
            onFill = theme.colors.textDefault
            fill = theme.colors.actionPrimaryDisabled
            fillPressed = theme.colors.actionPrimaryDisabled
            border = theme.colors.actionPrimaryDisabled
            
        case (.secondary, true):
            onFill = theme.colors.textDefault
            fill = theme.colors.textWhite
            fillPressed = theme.colors.textWhite
            border = theme.colors.textWhite
            
        case (.secondary, false):
            onFill = theme.colors.textDefault
            fill = theme.colors.actionPrimaryDisabled
            fillPressed = theme.colors.actionPrimaryDisabled
            border = theme.colors.actionPrimaryDisabled
            
        case (.secondaryOnPrimary, _):
            onFill = theme.colors.textOnPrimary
            fill = .clear
            fillPressed = .clear
            border = .clear
            
        case (.subdued, _):
            onFill = theme.colors.textDefault
            fill = theme.colors.actionSubdued
            fillPressed = theme.colors.actionPrimaryPressed
            border = theme.colors.borderDefault
            
        case (.subduedOnPrimary, _):
            onFill = theme.colors.actionTextOnActionSurfaceOnPrimary
            fill = theme.colors.actionSurfaceOnPrimary
            fillPressed = theme.colors.actionSurfaceOnPrimary
            border = theme.colors.actionSurfaceOnPrimary
            
        case (.critical, _):
            onFill = theme.colors.textDefault
            fill = theme.colors.actionSubdued
            fillPressed = theme.colors.actionSubduedPressed
            border = theme.colors.borderCritical
            
        }
        
        return Group {
            configuration.label
                .font(theme.typography.button)
                .padding(.vertical, 13)
        }.frame(maxWidth: .infinity)
            .frame(minHeight: 48)
            .padding(.horizontal, 16)
            .foregroundColor(onFill)
            .background(configuration.isPressed ? fillPressed : fill)
            .cornerRadius(6)
            .overlay(RoundedRectangle(cornerRadius: 6)
                .stroke(border, lineWidth: 1.0))
    }
}


struct Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            Button("Primary") {
                print("prinary")
            }.primary()
                .theme(Theme())
        }
    }
}
