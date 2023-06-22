//
//  MenuItemCell.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 22/06/2023.
//

import SwiftUI

struct MenuItemCell: View {
    @Environment(\.theme) var theme
    
    var body: some View {
        Group {
            listMenuItemCell()
        }
    }
    
    private func listMenuItemCell() ->  some View {
        HStack(alignment: .top, spacing: 8) {
            VStack {
                AutoSizeText(text: String(localized: "Pizza One"))
                    .font(theme.typography.headingSmall)
                    .foregroundColor(theme.colors.textOnSurfaceDefault)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                
                Text("Menu menu")
            }
        }
    }
}

struct MenuItemCell_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemCell()
    }
}
