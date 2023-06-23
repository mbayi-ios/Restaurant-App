//
//  HomeHubContentView.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 21/06/2023.
//

import SwiftUI

struct HomeHubContentView: View {
    @Environment(\.theme) var theme

    private var title: String? = "Hello Pizza One"
    private var description: String? = "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various"
    
    private var imageUrl: String? = ""
    private var buttonText: String? = ""
    private var buttonUrlString: String? = ""
    
    init(hubMarketing: ThemeConfiguration.Settings.HubMarketing) {
        title = hubMarketing.title
        description = hubMarketing.description
        imageUrl = hubMarketing.image
        buttonText = hubMarketing.buttonText
        buttonUrlString = hubMarketing.buttonURL
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image("pizza")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10, corners: [.topLeft, .topRight])
            
            Text(title!)
                .font(theme.typography.headingMedium)
                .padding(.leading)
                .padding(.trailing)
            
            Text(description!)
                .font(theme.typography.subheading)
                .foregroundColor(theme.colors.textSubdued)
                .padding(.leading)
                .padding(.trailing)
            
            Button(String(localized: "Read More")) {
                
            }
            .link()
            .padding(.leading)
            .padding(.bottom)
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(theme.colors.borderSubdued, lineWidth: 1))
        .padding(10)
    }
        
}

struct HomeHubContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHubContentView(hubMarketing: .init(image: "", title: "", buttonURL: "", buttonText: "", description: ""))
    }
}
