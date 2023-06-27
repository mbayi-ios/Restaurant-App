//
//  HTTPRequestHeaders.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

protocol HTTPRequestHeaders {
    var headers: [String: String] { get }
}
