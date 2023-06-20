//
//  CreateAccountView.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 20/06/2023.
//

import Foundation
import SwiftUI

struct CreateAccountView: View {
    @Environment (\.theme) var theme: Theme
    @Environment(\.dismiss) var dismiss
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    
    var body: some View {
        HStack{
            VStack {
                ScrollView {
                    VStack(alignment: .center, spacing: 16) {
                        headerSection()
                        signInButton()
                        formSection()
                        TermsOfServiceView()
                        createAccountButton()
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
    
    private func headerSection() -> some View {
        Group {
            theme.icons.base.brand
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 60)
            
            AutoSizeText(text: String(localized: "CreateAccountView.Label.CreateYourAccount"))
                .font(theme.typography.displayMedium)
                .foregroundColor(theme.colors.textOnSurfaceDefault)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 36)
        }
    }
    
    private func signInButton() -> some View {
        Button {
            dismiss()
        } label: {
            HStack(alignment: .center, spacing: 5) {
                Text(String(localized: "CreateAccountView.Label.AlreadyHaveAnAccount"))
                    .font(theme.typography.caption)
                    .foregroundColor(theme.colors.textOnSurfaceDefault)
                
                Text(String(localized: "CreateAccountView.Label.SignIn"))
                    .font(theme.typography.buttonLinkBold)
                    .tint(theme.colors.actionSecondary)
            }
        }
    }
    
    private func formSection() -> some View {
        Group {
            HStack(alignment: .center, spacing: 16) {
                FormField(
                    text: $firstName,
                    title: String(localized: "CreateAccountView.FieldTitle.FirstName"),
                    autocapitalized: .words,
                    autocorrectDisabled: true)
                
                FormField(
                    text: $firstName,
                    title: String(localized: "CreateAccountView.FieldTitle.LastName"),
                    autocapitalized: .words,
                    autocorrectDisabled: true)
            }
            
            FormField(
                text: $firstName,
                title: String(localized: "CreateAccountView.FieldTitle.EmailAddress"),
                placeholder: String(localized: "CreateAccountView.FieldPlaceholder.EmailAddress"),
                autocorrectDisabled: true,
                keyboardType: .emailAddress)
            
            FormField(text: $firstName,
                      title: String(localized: "CreateAccountView.FieldTitle.PhoneNumber"),
                      placeholder: String(localized: "CreateAccountView.FieldPlaceholder.PhoneNumber"),
            autocorrectDisabled: true,
                      keyboardType: .numberPad,
                      formatStyle: .phone,
            leftText: String(localized: "FormFields.Text.UsCode"))
            
            SecureFormField(
                text: $firstName,
                title: String(localized: "CreateAccountView.FieldTitle.Password"),
                placeholder: String(localized: "CreateAccountView.FieldPlaceholder.Password"),
                autocapitalized: UITextAutocapitalizationType.none,
                onEdit: { isEditing in
                    print("to be done")
                },
                onCommit: {
                    print("to be done")
                }
            )
        }
    }
    
    private func createAccountButton() -> some View {
        Button(String(localized: "CreateAccountView.Button.CreateAccount")){
            
        }
        .primary()
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
