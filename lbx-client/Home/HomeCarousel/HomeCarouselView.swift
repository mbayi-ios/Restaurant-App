//
//  HomeCarouselView.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 20/06/2023.
//

import SwiftUI

struct HomeCarouselView: View {
    @Environment(\.theme) var theme: Theme
    
    @State private var currentIndex = 0
    private let frameHeight = 475.0
    
    var body: some View {
        theme.icons.base.brand
            .resizable()
            .scaledToFit()
            .padding()
            .frame(height: frameHeight)
    }
}

struct HomeCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCarouselView()
    }
}
