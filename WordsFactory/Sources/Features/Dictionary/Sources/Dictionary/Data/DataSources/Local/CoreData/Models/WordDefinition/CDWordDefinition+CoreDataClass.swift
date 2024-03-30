//
//  CDWordDefinition+CoreDataClass.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 30.03.2024.
//
//

import Foundation
import CoreData

@objc(CDWordDefinition)
public class CDWordDefinition: NSManagedObject {

    static func insert(_ wordDefinition: WordDefinition, context: NSManagedObjectContext) {
        let cdModel = CDWordDefinition(context: context)

        cdModel.word = wordDefinition.word
        cdModel.phonetic = wordDefinition.phonetic
        cdModel.meanings = NSSet(array: wordDefinition.meanings.map { CDMeaning($0, context: context) })
        cdModel.phonetics = NSSet(array: wordDefinition.phonetics.map { CDPhonetic($0, context: context) })
    }

    func toDomain() -> WordDefinition {
        WordDefinition(
            word: word,
            phonetic: phonetic,
            meanings: meanings.toArray(of: CDMeaning.self).map { $0.toDomain() },
            phonetics: phonetics.toArray(of: CDPhonetic.self).map { $0.toDomain() }
        )
    }
}
