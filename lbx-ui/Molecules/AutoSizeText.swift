//
//  AutoSizeText.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 19/06/2023.
//

import Foundation
import SwiftUI

struct AutoSizeText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .minimumScaleFactor(0.5)
    }
}
