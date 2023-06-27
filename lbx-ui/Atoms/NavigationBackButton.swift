//
//  NavigationBackButton.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 27/06/2023.
//

import Foundation
import SwiftUI

struct NavigationBackButton: View {
    @Environment(\.theme) var theme: Theme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label :{
            Image(systemName: "chevron.backward")
                .resizable()
                .scaledToFit()
                .font(Font.body.weight(.bold))
                .foregroundColor(theme.colors.textOnSurfaceDefault)
                .frame(width: 15, height: 15)
        }
        
    }
}
