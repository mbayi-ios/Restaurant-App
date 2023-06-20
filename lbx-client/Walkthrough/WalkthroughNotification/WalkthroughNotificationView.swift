//
//  WalkthroughNotificationView.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 19/06/2023.
//

import SwiftUI

struct WalkthroughNotificationView: View {
    @Environment(\.theme) var theme: Theme
    @AppStorage("didShowWalkthrough") var didShowWalkthrough: Bool?
    
    var body: some View {
        NavigationView {
            HStack {
                Spacer()

                VStack {
                    Spacer()

                    VStack(spacing: 64) {
                        VStack(spacing: 32) {
                            theme.icons.walkthrough.notifications
                                .resizable()
                                .scaledToFit()
                                .frame(width: 335, height: 290)

                            VStack(spacing: 16) {
                                AutoSizeText(text: String(localized: "Walkthrough.Label.NeverMissUs"))
                                    .multilineTextAlignment(.center)
                                    .font(theme.typography.headingLarge)
                                    .foregroundColor(theme.colors.textOnPrimary)

                                Text(String(localized: "Walkthrough.Label.TurnOnNotification"))
                                    .multilineTextAlignment(.center)
                                    .font(theme.typography.body)
                                    .foregroundColor(theme.colors.textOnPrimary)
                            }
                            .padding(.horizontal, 48)
                        }

                        VStack(alignment: .center, spacing: 16) {
                            Button(String(localized: "Walkthrough.Label.EnableNotifications")) {
                                
                            }
                            .subduedOnPrimary()
                            .padding(.horizontal, 32)

                            Button(String(localized: "Walkthrough.Label.SkipForNow")) {
                                self.didShowWalkthrough = true
                            }
                            .secondaryOnPrimary()
                        }
                    }
                    
                    Spacer()
                }

                Spacer()
            }
            .background(theme.colors.brand).ignoresSafeArea()
        }
        
    }
}

struct WalkthroughNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughNotificationView()
    }
}
