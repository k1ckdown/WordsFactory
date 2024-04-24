//
//  Strings.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 11.04.2024.
//

import SwiftUI

enum Strings {
    static let appName = String(localized: "WordsFactory")
    static let needLogIn = String(localized: "NeedLogIn")
    static let dictionary = String(localized: "Dictionary")
    static let myDictionary = String(localized: "MyDictionary")
    static let occurredError = String(localized: "OccurredError")
    static let alreadyRemember = String(localized: "AlreadyRemember")
    static let dictionaryWord = String(localized: "DictionaryWord")
    static let dictionaryIsEmpty = String(localized: "DictionaryIsEmpty")
    static let dictionaryOverview = String(localized: "DictionaryOverview")
    static let dictionaryWordDescription = String(localized: "DictionaryWordDescription")

    static func words(_ count: Int) -> String {
        String(format: NSLocalizedString("Words", comment: ""), count)
    }
}
