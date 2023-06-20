//
//  TermsOfServiceView.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 20/06/2023.
//

import SwiftUI

struct TermsOfServiceView: View {
    @Environment(\.theme) var theme: Theme
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text(String(localized: "TermsOfService.Label.CreatingAnAccount"))
                .font(theme.typography.caption)
                .foregroundColor(theme.colors.textOnSurfaceDefault)
            
            HStack(alignment: .center, spacing: 5) {
                Text(String(localized: "TermsOfService.Label.Lunchboxs"))
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textOnSurfaceDefault)
                
                Button(String(localized: "TermsOfService.Button.TermsOfService")){
                    
                }
                .link()
                
                Text(String(localized: "TermsOfService.Label.And"))
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textOnSurfaceDefault)
                
                Button(String(localized: "TermsOfService.Button.PrivacyPolicy")){
                    
                }
                .link()
                
            }
        }
    }
}

struct TermsOfServiceView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView()
    }
}
