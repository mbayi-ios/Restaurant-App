//
//  ProfilePageView.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 20/06/2023.
//

import SwiftUI

struct ProfilePageView: View {
    @Environment(\.theme) var theme: Theme
    
    @State var firstName: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                formSection()
                
                NavigationLink("", destination: Text("updatepassword"))
                
                deleteAccountButton()
            }
             Spacer()
            
            saveButton()
        }
    }
    
    private func formSection() -> some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                firstNameField()
                lastNameField()
            }
            emailField()
            birthdayField()
            phoneField()
            passwordField()
        }
        .padding()
    }
    
    private func firstNameField() -> some View {
        FormField(
            text: $firstName,
            title: String(localized: "ProfilePageView.FieldTitle.FirstNameField"),
            autocapitalized: .words,
            autocorrectDisabled: true
        )
    }
    private func lastNameField() -> some View {
        FormField(
            text: $firstName,
            title: String(localized: "ProfilePageView.FieldTitle.LastNameField"),
            autocapitalized: .words,
            autocorrectDisabled: true
        )
    }
    
    private func emailField() -> some View {
        FormField(
            text: $firstName,
            title: String(localized: "ProfilePageView.FieldTitle.EmailField"),
            autocorrectDisabled: true,
            keyboardType: .emailAddress
        )
    }
    
    private func birthdayField() -> some View {
        FormField(
            text: $firstName,
            title: String(localized: "ProfilePageView.FieldTitle.BirthdayField"),
            placeholder: String(localized: "ProfilePageView.FieldPlaceholder.BirthdayField"),
            keyboardType: .numberPad,
            formatStyle: .birthday
        )
    }
    
    private func phoneField() -> some View {
        FormField(
            text: $firstName,
            title: String(localized: "ProfilePageView.FieldTitle.PhoneField"),
            isDisabled: true,
            isActionable: true,
            keyboardType: .numberPad,
            formatStyle: .phone,
            leftText: String(localized: "FormFields.Text.USCode")
            
        )
    }
    
    private func passwordField() -> some View {
        FormField(
            text: $firstName,
            title: String(localized: "ProfilePageView.FieldTitle.PasswordField"),
        isDisabled: true,
        isActionable: true)
    }
    
    private func deleteAccountButton() -> some View {
        HStack {
            Button(String(localized: "ProfilePageModel.Action.Delete")) {
                
            }
            .criticalLink()
            .padding(.horizontal)
            
            Spacer() 
        }
    }
    
    private func saveButton() -> some View {
        Button(String(localized: "ProfilePageModel.Action.Save")) {

        }
        .primary()
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
    
    
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
