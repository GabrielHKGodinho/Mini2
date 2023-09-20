//
//  StringExtension.swift
//  Dr!p
//
//  Created by Eduardo Stefanel Paludo on 18/09/23.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
