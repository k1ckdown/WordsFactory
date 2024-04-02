//
//  CDMeaning+CoreDataClass.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 02.04.2024.
//
//

import Foundation
import CoreData
import WordModuleAPI

@objc(CDMeaning)
public class CDMeaning: NSManagedObject {

    convenience init(_ meaning: Meaning, context: NSManagedObjectContext) {
        self.init(context: context)

        antonyms = meaning.antonyms
        synonyms = meaning.synonyms
        partOfSpeech = meaning.partOfSpeech
        definitions = NSSet(array: meaning.definitions.map { CDMeaningDefinition($0, context: context) })
    }

    func toDomain() -> Meaning {
        Meaning(
            partOfSpeech: partOfSpeech,
            synonyms: synonyms,
            antonyms: antonyms,
            definitions: definitions.toArray(of: CDMeaningDefinition.self).map { $0.toDomain() }
        )
    }
}
