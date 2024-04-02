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

    static func insert(_ wordDefinitions: [Word], context: NSManagedObjectContext) {
        wordDefinitions.forEach { insert($0, context: context) }
    }

    static func insert(_ wordDefinition: Word, context: NSManagedObjectContext) {
        let cdModel = CDWordDefinition(context: context)

        cdModel.word = wordDefinition.text
        cdModel.phonetic = wordDefinition.phonetic
        cdModel.meanings = NSSet(array: wordDefinition.meanings.map { CDMeaning($0, context: context) })
        cdModel.phonetics = NSSet(array: wordDefinition.phonetics.map { CDPhonetic($0, context: context) })
    }

    func toDomain() -> Word {
        Word(
            text: word,
            phonetic: phonetic,
            meanings: meanings.toArray(of: CDMeaning.self).map { $0.toDomain() },
            phonetics: phonetics.toArray(of: CDPhonetic.self).map { $0.toDomain() }
        )
    }
}
