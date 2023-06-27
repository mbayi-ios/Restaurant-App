//
//  HTTPMessageContextual.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

protocol HTTPMessageContextual {
    var scheme: URLScheme { get }
    var host: String { get }
    var headers: [String: String] { get }
}

extension HTTPMessageContextual {
    var hostUrl: URL? {
        return URL(string: "\(scheme.rawValue)\(host)")
    }
    
}
