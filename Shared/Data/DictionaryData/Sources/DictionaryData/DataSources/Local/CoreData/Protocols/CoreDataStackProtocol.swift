//
//  CoreDataStackProtocol.swift
//
//
//  Created by Ivan Semenov on 08.04.2024.
//

import CoreData

protocol CoreDataStackProtocol: AnyObject {
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void)
}
