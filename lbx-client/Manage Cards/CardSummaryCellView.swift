//
//  CardSummaryCellView.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 22/06/2023.
//

import SwiftUI

struct CardSummaryCellView: View {
    @Environment(\.theme) var theme
    var body: some View {
        VStack {
            HStack {
                HStack {
                   Image(systemName: "circle")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .foregroundColor(theme.colors.actionPrimary)
                    
                    Text("Visa ****** 34532")
                        .font(theme.typography.body)
                        .foregroundColor(theme.colors.textOnSurfaceDefault)
                        .padding(8)
                    Spacer()
                }
                
                Text(String(localized: "CardSummaryCell.Label.Delete"))
                    .font(theme.typography.buttonLinkBold)
                    .foregroundColor(theme.colors.actionSecondary)
            }
            Divider()
                .padding(.top, 10)
        }
        .padding()
    }
}

struct CardSummaryCellView_Previews: PreviewProvider {
    static var previews: some View {
        CardSummaryCellView()
    }
}
