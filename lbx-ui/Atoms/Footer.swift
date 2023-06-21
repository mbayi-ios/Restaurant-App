//
//  Footer.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 21/06/2023.
//

import SwiftUI

extension View {
    func footer<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        VStack {
            self
            Spacer()
        }
        .safeAreaInset(edge: .bottom) {
            Footer(content: content)
        }
        .ignoresSafeArea(.keyboard)
    }
}
struct Footer<Content: View>: View {
    @Environment(\.theme) var theme
    private let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            Divider()
                .foregroundColor(theme.colors.borderSubdued)
            content.padding(16)
        }
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("test\ntest")
        }
        .footer {
            Button {
                print("test")
            } label: {
                Text("Footer Button")
            }
        }
      
    }
}
