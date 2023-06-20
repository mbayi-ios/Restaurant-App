//
//  Colors.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 19/06/2023.
//
import Foundation
import SwiftUI

class Colors: Equatable
{
    init()
    {
        //self.brand = Color("Brand", bundle: .main)
        
        if UIColor(brand).isLight()
        {
            accentBrand = Color(UIColor(brand).darker(by: 25))
        }
        else
        {
            accentBrand = Color(UIColor(brand).lighter(by: 25))
        }

        surfaceDefault = Color(stringLiteral: "#FFFFFF")
        surfaceNavigation = Color(stringLiteral: "#FFFFFF")
    }
    
    var brand: Color = Color(stringLiteral: "#027148")
    var accentBrand: Color

    var textDefault: Color { "#000000" }    // "Bob Black"
    var textWhite: Color { "#FFFFFF" }
    var textBlack: Color { "#000000" }
    var textSubdued: Color { "#737373" }    // "Neutral 500"

    var textOnSurfaceDefault: Color
    {
        if UIColor(surfaceDefault).isLight()
        {
            return textBlack
        }
        else
        {
            return textWhite
        }
    }

    var textOnSurfaceSubdued: Color
    {
        if UIColor(surfaceSubdued).isLight()
        {
            return textBlack
        }
        else
        {
            return textWhite
        }
    }

    var textOnPrimary: Color
    {
        if UIColor(brand).isLight()
        {
            return textBlack
        }
        else
        {
            return textWhite
        }
    }

    var textDisabled: Color { "#404040" }

    var textSuccess: Color { "#069360" }
    var textWarning: Color { "#98661B" }
    var textCritical: Color { "#B53317" }
    var textCriticalSecondary: Color { "#B91C1C" }

    var actionPrimary: Color { brand }
    var actionPrimaryPressed: Color { brand } //darkened
    var actionPrimaryDisabled: Color { "#E0E0E0" }

    var actionSecondary: Color
    {
        if UIColor(accentBrand).isLight()
        {
            return brand
        }
        else
        {
            return accentBrand
        }
    }

    var actionSubdued: Color { "#FFFFFF" }
    var actionSubduedPressed: Color { "#F5F5F5" }

    var actionSurfaceOnPrimary: Color
    {
        if UIColor(brand).isLight()
        {
            return surfaceBlack
        }
        else
        {
            return surfaceWhite
        }
    }

    var actionTextOnActionSurfaceOnPrimary: Color
    {
        if UIColor(actionSurfaceOnPrimary).isLight()
        {
            return textBlack
        }
        else
        {
            return textWhite
        }
    }

    var interactiveDefault: Color
    {
        if UIColor(accentBrand).isLight()
        {
            return brand
        }
        else
        {
            return accentBrand
        }
    }

    var interactivePressed: Color
    {
        if UIColor(accentBrand).isLight()
        {
            return brand
        }
        else
        {
            return accentBrand
        }
    }

    var interactiveDisabled: Color { "#E0E0E0" }

    var borderDefault: Color { "#737373" } // "Neutral 500"
    var borderSubdued: Color { "#E5E5E5" } // "Neutral 200"

    var borderActionPrimary: Color
    {
        if UIColor(brand).isLight()
        {
            return accentBrand
        }
        else
        {
            return brand
        }
    }

    var borderCritical: Color { "#B91C1C" }
    var borderDisabled: Color { "#E0E0E0" }
    var borderRadioDisabled: Color { "#525252" }    // "Neutral 600"
    var borderSelected: Color { brand }
    var borderPressed: Color { "#515F5F" }
    var borderSuccess: Color { "#07B8BA" }

    var surfaceDefault: Color
    var surfaceNavigation: Color
    var surfaceSubdued: Color { "#F5F5F5" } // "Neutral 100"
    var surfaceConfirmed: Color { "#ECFDF5" } // "Emerald"
    var surfaceWarning: Color { "#FFFEE9" }
    var surfaceError: Color { "#FEF2F2" }
    var surfaceSuccess: Color { "#EEFFFF" }
    var surfaceWhite: Color { "#FFFFFF" }
    var surfaceBlack: Color { "#000000" }    // "Bob Black"

    var indicatorSuccess: Color { "#059669" } // "Emerald 600"
    var indicatorCritical: Color { "#B91C1C" }
    var indicatorWarning: Color { "#8F7107" }

    func updateColors(with configuration: ThemeConfiguration)
    {
        guard let themeColors = configuration.settings?.themeColors else
        {
            return
        }

        if let brand = themeColors.brand
        {
            self.brand = Color(stringLiteral: brand)
        }

        if let accent = themeColors.accent
        {
            self.accentBrand = Color(stringLiteral: accent)
        }

        if let background = themeColors.background
        {
            self.surfaceDefault = Color(stringLiteral: background)
        }
    }

    static func == (lhs: Colors, rhs: Colors) -> Bool
    {
        return lhs.brand == rhs.brand
    }
}

extension Color: ExpressibleByStringLiteral
{
    public init(stringLiteral value: String)
    {
        let hex = value.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64

        switch hex.count
        {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension UIColor
{
    func isLight() -> Bool
    {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let brightness = ((r * 299) + (g * 587) + (b * 114)) / 1_000
        
        return brightness >= 0.7
    }

    func lighter(by percentage: CGFloat = 30.0) -> UIColor
    {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor
    {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> UIColor
    {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0

        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else
        {
            return self
        }

        return UIColor(red: min(red + percentage/100, 1.0),
                       green: min(green + percentage/100, 1.0),
                       blue: min(blue + percentage/100, 1.0),
                       alpha: alpha)
    }
}

struct AccentColorExample: View
{
    @Environment(\.theme) var theme: Theme

    var body: some View
    {
        HStack(alignment: .center, spacing: 20)
        {
            VStack
            {
                Circle()
                    .foregroundColor(theme.colors.actionPrimary)
                    .frame(width: 100, height: 100)

                Text("Brand color")
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textDefault)
            }

            VStack
            {
                Circle()
                    .foregroundColor(theme.colors.accentBrand)
                    .frame(width: 100, height: 100)

                Text("Accent color")
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textDefault)
            }
        }
    }
}
