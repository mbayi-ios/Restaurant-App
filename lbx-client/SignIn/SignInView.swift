//
//  SignInView.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 19/06/2023.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.theme) var theme: Theme
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = SignInViewModel()
    
    var isSignInRootView: Bool = false
  
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .center, spacing: 16) {
                        headerLabel()
                        createAccountButton()
                        emailField()
                        passwordField()
                        
                        HStack {
                            forgotPasswordButton()
                            
                            Spacer()
                        }
                        
                    }
                    .padding(.horizontal, 16)
                }
                Spacer()
                
                termsOfServiceSection()
                
                signInButton()
            }
        }
        .loadingOverlay($viewModel.isLoading)
        .errorAlert(error: $viewModel.error)
        .navigationBar(theme: theme, title: "", leadingItem: self.navBarLogo())
    }
    
    private func headerLabel() -> some View {
        VStack(alignment: .center, spacing: 16) {
            theme.icons.base.brand
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 80)
            
            AutoSizeText(text: String(localized: "SignInView.Label.SignIntoYourAccount"))
                .font(theme.typography.displayMedium)
                .foregroundColor(theme.colors.textOnSurfaceDefault)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 36)
        }
        .padding(.top, 16)
    }
    
    private func createAccountButton() -> some View {
        NavigationLink(destination: CreateAccountView()) {
            HStack(alignment: .center, spacing: 5) {
                Text(String(localized: "SignInView.Label.DontHaveAnAccount"))
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textOnSurfaceDefault)
                
                Text(String(localized: "SignInView.Label.CreateAccount"))
                    .font(theme.typography.buttonLinkBold)
                    .tint(theme.colors.actionSecondary)
            }
        }
    }
    
    private func emailField() -> some View {
        FormField(
            text: $viewModel.model.email,
            title: String(localized: "SignInView.FieldTitle.EmailAddress"),
            placeholder: String(localized: "SignInView.FieldPlaceHolder.EmailAddress"),
            autocorrectDisabled: true,
            contentType: .emailAddress,
            keyboardType: .emailAddress
        )
    }
    
    private func passwordField() -> some View {
        SecureFormField(
            text: $viewModel.model.password,
            title: String(localized: "SignInView.FieldTitle.Password"),
            placeholder: String(localized: "SignInView.FieldPlaceholder.Password"),
            contentType: .password
        ) {
            
        }
    }
    
    private func forgotPasswordButton() -> some View {
        NavigationLink(destination: Text("forgot password View")) {
            Text(String(localized: "SignInView.Button.ForgotPassword"))
                .font(theme.typography.buttonLink)
                .tint(theme.colors.actionSecondary)
        }
    }
    
    private func signInButton() -> some View {
        Button {
            viewModel.handleSignIn()
        } label : {
            Text(String(localized: "SignInView.Button.SignIn"))
        }
        .primary()
        .padding()
    }
    
    private func termsOfServiceSection() -> some View {
        VStack(alignment: .center, spacing: 5) {
            Text(String(localized: "TermsOfService.Label.SigningIn"))
                .font(theme.typography.caption)
                .foregroundColor(theme.colors.textOnSurfaceDefault)
            
            HStack(alignment: .center, spacing: 5){
                Text(String(localized: "TermsOfService.Label.Lunchboxs"))
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textOnSurfaceDefault)
                
                Button(String(localized: "TermsOfService.Button.TermsOfService")) {
                    
                }
                .link()
                
                Text(String(localized: "TermsOfService.Label.And"))
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textOnSurfaceDefault)
                
                Button(String(localized: "TermsOfService.Button.PrivacyPolicy")) {
                    
                }
                .link()
                
            }
        }
    }
    
    private func navBarLogo() -> some View {
        HStack() {
            NavigationBackButton()
                Spacer()
        }
        .padding([.top, .bottom], 5)
        .frame(width: 100)
    }
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
