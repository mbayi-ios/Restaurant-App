//
//  String+Extensions.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 19/06/2023.
//

import Foundation

enum StringFormatStyle: String {
    case phone = "(XXX) XXX-XXXX"
    case ccNumber = "XXXX XXXX XXXX XXXX"
    case ccExpiration = "XX/XX"
    case cvc = "XXXX"
    case postalCode = "XXXXX"
    case birthday = "XX/XX/XXXX"
}

extension String {
    func removeSpaces() -> String {
        return self.replacingOccurrences(of: " ", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func formatString(with formatStyle: StringFormatStyle) -> (formattedString: String, rawValue: String) {
        let mask = formatStyle.rawValue
        let numbers = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        
        for char in mask where index < numbers.endIndex {
            if char == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(char)
            }
        }
        return(result, numbers)
    }
    
    func extractJSONError() -> String {
        let stringData = Data(self.utf8)
        let decoder = JSONDecoder()
        if let stringObject = try? decoder.decode(JSONErrorMessage.self, from: stringData) {
            return stringObject.error
        }
        
        return self
    }
}

private struct JSONErrorMessage: Decodable {
    let error: String
}
