//
//  CDUserWords+CoreDataProperties.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 23.04.2024.
//
//

import Foundation
import CoreData


extension CDUserWords {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUserWords> {
        return NSFetchRequest<CDUserWords>(entityName: "CDUserWords")
    }

    @NSManaged public var userId: String
    @NSManaged public var words: NSSet

}

// MARK: Generated accessors for words
extension CDUserWords {

    @objc(addWordsObject:)
    @NSManaged public func addToWords(_ value: CDWord)

    @objc(removeWordsObject:)
    @NSManaged public func removeFromWords(_ value: CDWord)

    @objc(addWords:)
    @NSManaged public func addToWords(_ values: NSSet)

    @objc(removeWords:)
    @NSManaged public func removeFromWords(_ values: NSSet)

}

extension CDUserWords : Identifiable {

}
