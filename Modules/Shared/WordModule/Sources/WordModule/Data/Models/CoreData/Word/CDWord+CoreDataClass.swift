//
//  CDWord+CoreDataClass.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 03.04.2024.
//
//

import Foundation
import CoreData
import WordModuleAPI

@objc(CDWord)
public class CDWord: NSManagedObject {

    convenience init(_ word: Word, context: NSManagedObjectContext) {
        self.init(context: context)

        text = word.text
        definitions = NSSet(array: word.definitions.map { CDWordDefinition($0, context: context) })
    }
}
