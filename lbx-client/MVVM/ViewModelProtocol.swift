//
//  ViewModelProtocol.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 23/06/2023.
//

import Foundation
import SwiftUI

protocol ViewModelProtocol: ObservableObject {
    associatedtype Model: ModelProtocol
    
    var model: Model { get }
}
