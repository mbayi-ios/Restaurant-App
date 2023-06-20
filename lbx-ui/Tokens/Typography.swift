//
//  Typography.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 19/06/2023.
//

import Foundation
import SwiftUI
import CoreText


public struct Typography {
    static let Inter = "Inter"
    public var headingLarge: Font { header(size: 20).weight(.semibold)}
    
    public var caption: Font { body(size: 12) }
    
    public var displayMedium: Font { header(size: 26).weight(.regular)}
    
    public var buttonLinkBold: Font { body(size: 12).weight(.bold)}
    
    public var headingSmall: Font { header(size: 16).weight(.semibold) }
    
    public var body: Font { body(size: 14)}
    
    public var button: Font { body(size: 16).weight(.bold)}
    
    public var buttonLink: Font { body(size: 12) }
    
    private var headerFontName: String? {
        return Config.shared.headerFontName
    }
    
    private var bodyFontName: String? {
        return Config.shared.bodyFontName
    }
    
    private func header(size: CGFloat) -> Font {
        return font(fontName: headerFontName, size: size)
    }
    
    private func body(size: CGFloat) -> Font {
        return font(fontName: bodyFontName, size: size)
    }
    
    private func font(fontName: String?, size: CGFloat) -> Font {
        guard let fontName = fontName, !fontName.isEmpty else {
            return Font.custom(Typography.Inter, size: size)
        }
        
        return Font.custom(fontName, size: size)
    }
}
