//
//  CDWordDefinition+CoreDataProperties.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 30.03.2024.
//
//

import Foundation
import CoreData


extension CDWordDefinition {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWordDefinition> {
        return NSFetchRequest<CDWordDefinition>(entityName: "CDWordDefinition")
    }

    @NSManaged public var phonetic: String?
    @NSManaged public var word: String?
    @NSManaged public var meanings: NSSet?
    @NSManaged public var phonetics: NSSet?

}

// MARK: Generated accessors for meanings
extension CDWordDefinition {

    @objc(addMeaningsObject:)
    @NSManaged public func addToMeanings(_ value: CDMeaning)

    @objc(removeMeaningsObject:)
    @NSManaged public func removeFromMeanings(_ value: CDMeaning)

    @objc(addMeanings:)
    @NSManaged public func addToMeanings(_ values: NSSet)

    @objc(removeMeanings:)
    @NSManaged public func removeFromMeanings(_ values: NSSet)

}

// MARK: Generated accessors for phonetics
extension CDWordDefinition {

    @objc(addPhoneticsObject:)
    @NSManaged public func addToPhonetics(_ value: CDPhonetic)

    @objc(removePhoneticsObject:)
    @NSManaged public func removeFromPhonetics(_ value: CDPhonetic)

    @objc(addPhonetics:)
    @NSManaged public func addToPhonetics(_ values: NSSet)

    @objc(removePhonetics:)
    @NSManaged public func removeFromPhonetics(_ values: NSSet)

}

extension CDWordDefinition : Identifiable {

}
