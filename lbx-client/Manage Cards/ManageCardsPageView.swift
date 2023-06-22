//
//  ManageCardsPageView.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 22/06/2023.
//

import SwiftUI

struct ManageCardsPageView: View {
    @Environment(\.theme) var theme
    var body: some View {
        ScrollView {
            ForEach(1...3, id: \.self) { _ in
                CardSummaryCellView()
            }
            
            addPaymentButton()
            
        }
        .footer {
            Button("Set default") {
                
            }.primary()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("back")
            }
            ToolbarItem(placement: .principal) {
                AutoSizeText(text: String(localized: "ManageCardsPageView.Label.DefaultManageCardsPageTitle"))
                    .font(theme.typography.headingSmall)
                    .foregroundColor(theme.colors.textOnSurfaceDefault)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func addPaymentButton() -> some View {
        NavigationLink(destination: Text("add card")) {
            AutoSizeText(text: String(localized: "CardSummaryCell.Label.Add"))
                .font(theme.typography.headingMedium)
                .foregroundColor(theme.colors.textOnSurfaceDefault)
                .scaledToFit()
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 6, style: .circular)
            .stroke(theme.colors.borderDefault, lineWidth: 1))
        .padding()
    }
}

struct ManageCardsPageView_Previews: PreviewProvider {
    static var previews: some View {
        ManageCardsPageView()
    }
}
