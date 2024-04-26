//
//  CDWordDefinition+CoreDataClass.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 02.04.2024.
//
//

import Foundation
import CoreData
import DictionaryDomain

@objc(CDWordDefinition)
public class CDWordDefinition: NSManagedObject {

    convenience init(_ word: WordDefinition, context: NSManagedObjectContext) {
        self.init(context: context)

        phonetic = word.phonetic
        meanings = NSSet(array: word.meanings.map { CDMeaning($0, context: context) })
        phonetics = NSSet(array: word.phonetics.map { CDPhonetic($0, context: context) })
    }
}
