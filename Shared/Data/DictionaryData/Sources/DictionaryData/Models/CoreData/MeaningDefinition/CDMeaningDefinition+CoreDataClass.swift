//
//  CDMeaningDefinition+CoreDataClass.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 02.04.2024.
//
//

import Foundation
import CoreData
import DictionaryDomain

@objc(CDMeaningDefinition)
public class CDMeaningDefinition: NSManagedObject {

    convenience init(_ meaningDefinition: MeaningDefinition, context: NSManagedObjectContext) {
        self.init(context: context)

        antonyms = meaningDefinition.antonyms
        synonyms = meaningDefinition.synonyms
        example = meaningDefinition.example
        definition = meaningDefinition.definition
    }
}
