//
//  KeyStore.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 26/06/2023.
//

import Foundation

protocol KeyStore {
    func set(value: Any, for key: String) -> Void
    func get(_ key: String) -> Any?
    func clearValue(for key: String) -> Void
}
