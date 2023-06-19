//
//  Config.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 19/06/2023.
//

import Foundation
class Config {
    enum Property: String {
        case headerFontName = "Header Font Name"
        case bodyFontName = "Body Font Name"
    }
    
    static let shared = Config()
    
    private var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    var headerFontName: String? {
        return safePropertyString(forKey: .headerFontName)
    }
    
    var bodyFontName: String? {
        return safePropertyString(forKey: .bodyFontName)
    }
    
    private func safePropertyString(for givenBundle: Bundle? = nil, forKey key: Property) -> String? {
        guard let string = (givenBundle ?? bundle).object(forInfoDictionaryKey: key.rawValue) as? String else {
            return nil
        }
        
        return string.replacingOccurrences(of: "\\n", with: "\n")
    }
}
