//
//  AccountPageView.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 21/06/2023.
//

import SwiftUI

struct AccountPageView: View {
    @Environment(\.theme) var theme
    var body: some View {
        NavigationView {
            VStack {
                headerView()
                Divider()
                
                List {
                    Section {
                        ForEach((1...3), id: \.self) {_ in
                            NavigationLink {
                                
                            } label: {
                                Text("Profile")
                            }
                        }
                        .padding()
                        .listRowSeparator(.hidden)
                        .font(theme.typography.button)
                        
                        logoutButton()
                    }
                    .listSectionSeparator(.hidden)
                    
                }
                .listStyle(.plain)
                
                Spacer()
                
                termsButton()
            }
        }
        
    }
    private func headerView() -> some View {
        HStack {
            Spacer()
            HStack {
                AutoSizeText(text: "Amby Mbayi")
                    .font(theme.typography.headingMedium)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
        }
        .padding(.top, 16)
    }
    private func logoutButton() -> some View {
        HStack {
            Button {
                
            } label: {
                Text(String(localized: "AccountPageView.Action.LogoutCaps"))
                    .font(theme.typography.buttonLinkBold)
                    .foregroundColor(theme.colors.actionSecondary)
            }
            Spacer()
        }
        .padding()
    }
    
    private func termsButton() -> some View {
        HStack {
            Spacer()
            
            Button {
                
            } label : {
                Text(String(localized: "AccountPageView.Action.TermsPrivacyPolicy"))
                    .font(theme.typography.buttonLinkBold)
                    .tint(theme.colors.actionSecondary)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct AccountPageView_Previews: PreviewProvider {
    static var previews: some View {
        AccountPageView()
    }
}
