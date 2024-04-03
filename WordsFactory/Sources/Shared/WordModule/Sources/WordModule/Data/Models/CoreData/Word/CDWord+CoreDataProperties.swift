//
//  CDWord+CoreDataProperties.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 03.04.2024.
//
//

import Foundation
import CoreData


extension CDWord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWord> {
        return NSFetchRequest<CDWord>(entityName: "CDWord")
    }

    @NSManaged public var studyCoefficient: Int64
    @NSManaged public var text: String
    @NSManaged public var definitions: NSSet

}

// MARK: Generated accessors for definitions
extension CDWord {

    @objc(addDefinitionsObject:)
    @NSManaged public func addToDefinitions(_ value: CDWordDefinition)

    @objc(removeDefinitionsObject:)
    @NSManaged public func removeFromDefinitions(_ value: CDWordDefinition)

    @objc(addDefinitions:)
    @NSManaged public func addToDefinitions(_ values: NSSet)

    @objc(removeDefinitions:)
    @NSManaged public func removeFromDefinitions(_ values: NSSet)

}

extension CDWord : Identifiable {

}
