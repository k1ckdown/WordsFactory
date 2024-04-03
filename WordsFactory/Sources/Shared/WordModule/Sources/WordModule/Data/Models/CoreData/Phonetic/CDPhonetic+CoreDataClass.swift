//
//  CDPhonetic+CoreDataClass.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 02.04.2024.
//
//

import Foundation
import CoreData
import WordModuleAPI

@objc(CDPhonetic)
public class CDPhonetic: NSManagedObject {

    convenience init(_ phonetic: Phonetic, context: NSManagedObjectContext) {
        self.init(context: context)

        audio = phonetic.audio
        text = phonetic.text
    }
}
