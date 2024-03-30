//
//  CDMeaningDefinition+CoreDataClass.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 30.03.2024.
//
//

import Foundation
import CoreData

@objc(CDMeaningDefinition)
public class CDMeaningDefinition: NSManagedObject {

    convenience init(_ meaningDefinition: MeaningDefinition, context: NSManagedObjectContext) {
        self.init(context: context)

        antonyms = meaningDefinition.antonyms
        synonyms = meaningDefinition.synonyms
        example = meaningDefinition.example
        definition = meaningDefinition.definition
    }

    func toDomain() -> MeaningDefinition {
        MeaningDefinition(
            definition: definition,
            synonyms: synonyms,
            antonyms: antonyms,
            example: example
        )
    }
}
