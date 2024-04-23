//
//  CDUserWord+CoreDataProperties.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 23.04.2024.
//
//

import Foundation
import CoreData


extension CDUserWord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUserWord> {
        return NSFetchRequest<CDUserWord>(entityName: "CDUserWord")
    }

    @NSManaged public var text: String
    @NSManaged public var userId: String
    @NSManaged public var studyCoefficient: Int64
}

extension CDUserWord : Identifiable {

}
