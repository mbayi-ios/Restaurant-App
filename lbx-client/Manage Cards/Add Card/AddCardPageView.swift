//
//  AddCardPageView.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 22/06/2023.
//

import SwiftUI

struct AddCardPageView: View {
    @State var firstName: String = ""
    var body: some View {
        VStack {
            ScrollView {
                formFields()
                
            }
            Spacer()
            .padding()
            Group {
                addCardButton()
                editCardButton()
            }
            .padding()
            .padding(.bottom, 10)
        }
    }
    
    private func formFields() -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                FormField(
                    text: $firstName,
                    title: String(localized: "AddCardPage.FormTitle.FirstName"),
                    autocapitalized: .words,
                    autocorrectDisabled: true
                )
                FormField(
                    text: $firstName,
                    title: String(localized: "AddCardPage.FormTitle.FirstName"),
                    autocapitalized: .words,
                    autocorrectDisabled: true
                )
            }
            
            FormField(
                text: $firstName,
                title: String(localized: "AddCardPage.FormTitle.Zip"),
                placeholder: String(localized: "AddCardPage.FormPlaceholder.Zip"),
                autocapitalized: .words,
                autocorrectDisabled: true
            )
        }
        .padding()
    }
    
    private func addCardButton() -> some View {
        Button(String(localized: "AddCardPage.Label.Add")){
            
        }
        .primary()
      
    }
    
    private func editCardButton() -> some View {
        Button(String(localized: "AddCardPage.Label.Edit")) {
            
        }
        .primary()
       
    }
}

struct AddCardPageView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardPageView()
    }
}
