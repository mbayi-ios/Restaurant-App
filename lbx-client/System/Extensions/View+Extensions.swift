//
//  View+Extensions.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 21/06/2023.
//

import SwiftUI

extension View {
    
    func navigationBar() -> some View {
        self.navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
    }
    
    func navigationBarBack(canDismiss: Bool = true) -> some View {
        self.navigationBar()
            .navigationBarItems(leading: canDismiss ? NavigationBackButton(): nil)
    }
    
    func navigationBarBack(theme: Theme, title: String) -> some View {
        self.navigationBar(theme: theme, title: title)
            .navigationBarItems(leading: NavigationBackButton())
    }
    
    func navigationBarBack<Trailing: View>(theme: Theme, title: String, trailingItem: Trailing) -> some View {
        self.navigationBarBack(theme: theme, title: title)
            .navigationBarItems(trailing: trailingItem)
    }
    
    func navigationBar(theme: Theme, title: String) -> some View {
        self.navigationBar()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    AutoSizeText(text: title)
                        .font(theme.typography.headingSmall)
                }
            }
    }
    
    func navigationBar<Leading: View, Trailing: View>(theme: Theme, title: String, leadingItem: Leading, trailingItem: Trailing) -> some View {
        self.navigationBar(theme: theme, title: title)
            .navigationBarItems(leading: leadingItem, trailing: trailingItem)
    }
    
    func navigationBar<Leading: View>(theme: Theme, title: String, leadingItem: Leading) -> some View {
        self.navigationBar(theme: theme, title: title)
            .navigationBarItems(leading: leadingItem)
    }
    
    func navigationBar<Trailing: View>(theme: Theme, title: String, trailingItem: Trailing) -> some View {
        self.navigationBar(theme: theme, title: title)
            .navigationBarItems(trailing: trailingItem)
    }
    
    func removeSeparatorAndInsets() -> some View {
        self.listRowSeparator(.hidden)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
