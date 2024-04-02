//
//  CDWord+CoreDataClass.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 02.04.2024.
//
//

import Foundation
import CoreData
import WordModuleAPI

@objc(CDWord)
public class CDWord: NSManagedObject {

    static func insert(_ words: [Word], context: NSManagedObjectContext) {
        words.forEach { insert($0, context: context) }
    }

    static func insert(_ word: Word, context: NSManagedObjectContext) {
        let cdModel = CDWord(context: context)

        cdModel.text = word.text
        cdModel.phonetic = word.phonetic
        cdModel.meanings = NSSet(array: word.meanings.map { CDMeaning($0, context: context) })
        cdModel.phonetics = NSSet(array: word.phonetics.map { CDPhonetic($0, context: context) })
    }

    func toDomain() -> Word {
        Word(
            text: text,
            phonetic: phonetic,
            meanings: meanings.toArray(of: CDMeaning.self).map { $0.toDomain() },
            phonetics: phonetics.toArray(of: CDPhonetic.self).map { $0.toDomain() }
        )
    }
}
