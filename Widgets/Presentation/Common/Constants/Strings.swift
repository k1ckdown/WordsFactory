//
//  Strings.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 11.04.2024.
//

import SwiftUI

enum Strings {
    static let appName = "WordsFactory"
    static let dictionary = "Dictionary"
    static let myDictionary = "MyDictionary"
    static let alreadyRemember = "AlreadyRemember"
    static let dictionaryOverview = "DictionaryOverview"
    
    static func words(_ count: Int) -> String {
        String(format: NSLocalizedString("Words", comment: ""), count)
    }
}
