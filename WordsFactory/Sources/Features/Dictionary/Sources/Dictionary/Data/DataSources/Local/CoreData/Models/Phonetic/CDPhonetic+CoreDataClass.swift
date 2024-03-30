//
//  CDPhonetic+CoreDataClass.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 30.03.2024.
//
//

import Foundation
import CoreData

@objc(CDPhonetic)
public class CDPhonetic: NSManagedObject {

    convenience init(_ phonetic: Phonetic, context: NSManagedObjectContext) {
        self.init(context: context)

        audio = phonetic.audio
        text = phonetic.text
    }

    func toDomain() -> Phonetic {
        Phonetic(text: text, audio: audio)
    }
}
