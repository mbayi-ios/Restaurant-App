//
//  HomeView.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 20/06/2023.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.theme) var theme
   // @Environment(\.dependencies.state.themeConfigurationState.themeConfiguration?.settings?.hubMarketing) var hubMarketing
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    HomeCarouselView()
                    VStack {
                        Button {
                            
                        } label: {
                            Text(String(localized: "HomePage.Action.StartOrder"))
                        }
                        .primary()
                        .padding(10)

                    }
                    //HomeHubContentView()
                    //HomeHubContentView()
                    //HomeHubContentView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Spacer()
                }
                ToolbarItem(placement: .principal) {
                    theme.icons.base.logo
                        .resizable()
                        .scaledToFit()
                        .padding(8)
                        //.offset()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    signInButton()
                }
                
            }
           
        }
    }
    
    private func navBarLogo() -> some View {
        HStack {
            theme.icons.base.brand
        }
    }
    
    private func signInButton() -> some View {
        NavigationLink(destination: SignInView()){
            HStack {
                Text(String(localized: "Account.Action.Login"))
                    .font(theme.typography.body)
                    .tint(theme.colors.textOnSurfaceDefault)
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
