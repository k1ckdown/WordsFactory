//
//  CDMeaning+CoreDataProperties.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 30.03.2024.
//
//

import Foundation
import CoreData


extension CDMeaning {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMeaning> {
        return NSFetchRequest<CDMeaning>(entityName: "CDMeaning")
    }

    @NSManaged public var antonyms: [String]
    @NSManaged public var partOfSpeech: String
    @NSManaged public var synonyms: [String]
    @NSManaged public var definitions: NSSet
    @NSManaged public var wordDefinition: CDWordDefinition?

}

// MARK: Generated accessors for definitions
extension CDMeaning {

    @objc(addDefinitionsObject:)
    @NSManaged public func addToDefinitions(_ value: CDMeaningDefinition)

    @objc(removeDefinitionsObject:)
    @NSManaged public func removeFromDefinitions(_ value: CDMeaningDefinition)

    @objc(addDefinitions:)
    @NSManaged public func addToDefinitions(_ values: NSSet)

    @objc(removeDefinitions:)
    @NSManaged public func removeFromDefinitions(_ values: NSSet)

}

extension CDMeaning : Identifiable {

}
