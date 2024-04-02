//
//  CDWord+CoreDataProperties.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 02.04.2024.
//
//

import Foundation
import CoreData


extension CDWord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWord> {
        return NSFetchRequest<CDWord>(entityName: "CDWord")
    }

    @NSManaged public var phonetic: String?
    @NSManaged public var text: String
    @NSManaged public var studyCoefficient: Int32
    @NSManaged public var meanings: NSSet
    @NSManaged public var phonetics: NSSet

}

// MARK: Generated accessors for meanings
extension CDWord {

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
extension CDWord {

    @objc(addPhoneticsObject:)
    @NSManaged public func addToPhonetics(_ value: CDPhonetic)

    @objc(removePhoneticsObject:)
    @NSManaged public func removeFromPhonetics(_ value: CDPhonetic)

    @objc(addPhonetics:)
    @NSManaged public func addToPhonetics(_ values: NSSet)

    @objc(removePhonetics:)
    @NSManaged public func removeFromPhonetics(_ values: NSSet)

}

extension CDWord : Identifiable {

}
