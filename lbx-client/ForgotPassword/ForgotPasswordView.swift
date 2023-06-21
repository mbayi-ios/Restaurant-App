//
//  ForgotPasswordView.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 21/06/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.theme) var theme
    @State var email: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            theme.icons.base.brand
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            header()
                .padding()
            
            emailField()
            Spacer()
        }
        .padding(.horizontal, 16)
        .footer {
            forgotPasswordButton()
        }
    }
    
    private func header() -> some View {
        VStack {
            AutoSizeText(text: String(localized: "ForgotPassword.Label.ForgotPassword"))
                .font(theme.typography.displayMedium)
                .padding(.bottom, 8)
            
            Text(String(localized: "ForgotPassword.Label.PleaseEnterEmail"))
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(theme.typography.caption)
                .foregroundColor(theme.colors.textOnSurfaceDefault)
            
        }
    }
    
    private func emailField() -> some View {
        FormField(
            text: $email,
            title: String(localized: "ForgotPassword.FieldTitle.EmailAddress"),
            placeholder: String(localized: "ForgotPassword.FieldPlaceholder.EmailAddress"),
            autocorrectDisabled: true,
            contentType: .emailAddress,
            keyboardType: .emailAddress,
            onCommit: {
                print("to be done")
            }
        )
    }
    
    private func forgotPasswordButton() -> some View {
        Button {
            
        } label: {
            Text(String(localized: "ForgotPassword.Label.ResetPassword"))
        }
        .primary()
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
