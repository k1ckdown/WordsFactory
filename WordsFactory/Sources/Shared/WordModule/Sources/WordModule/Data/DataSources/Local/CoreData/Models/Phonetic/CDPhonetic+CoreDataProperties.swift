//
//  CDPhonetic+CoreDataProperties.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 02.04.2024.
//
//

import Foundation
import CoreData


extension CDPhonetic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPhonetic> {
        return NSFetchRequest<CDPhonetic>(entityName: "CDPhonetic")
    }

    @NSManaged public var audio: String?
    @NSManaged public var text: String?
    @NSManaged public var word: CDWord?

}

extension CDPhonetic : Identifiable {

}
