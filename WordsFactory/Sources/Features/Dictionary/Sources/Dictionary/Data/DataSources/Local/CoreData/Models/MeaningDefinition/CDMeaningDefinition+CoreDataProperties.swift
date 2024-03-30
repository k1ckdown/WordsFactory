//
//  CDMeaningDefinition+CoreDataProperties.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 30.03.2024.
//
//

import Foundation
import CoreData


extension CDMeaningDefinition {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMeaningDefinition> {
        return NSFetchRequest<CDMeaningDefinition>(entityName: "CDMeaningDefinition")
    }

    @NSManaged public var antonyms: [String]
    @NSManaged public var definition: String
    @NSManaged public var example: String?
    @NSManaged public var synonyms: [String]
    @NSManaged public var meaning: CDMeaning?

}

extension CDMeaningDefinition : Identifiable {

}
