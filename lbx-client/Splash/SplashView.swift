//
//  SplashView.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 19/06/2023.
//

import SwiftUI

struct SplashView: View {
    @Environment(\.theme) var theme: Theme
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Spacer()
                
                ZStack {
                    theme.icons.base.brand
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .padding(16)
                        
                }
                .background(theme.colors.surfaceDefault)
                .cornerRadius(24)
                .shadow(color: .black.opacity(0.08), radius: 0.1, x: 0, y: 4)
                
                Spacer()
            }
            Spacer()
        }
        .background(theme.colors.brand)
        .ignoresSafeArea()
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
