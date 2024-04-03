//
//  CDModelProvider.swift
//
//
//  Created by Ivan Semenov on 02.04.2024.
//

import CoreData

typealias CDModelProvider<T: NSManagedObject> = (NSManagedObjectContext) -> T
