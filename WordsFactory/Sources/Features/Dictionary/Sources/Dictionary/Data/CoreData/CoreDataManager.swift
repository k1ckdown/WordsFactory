//
//  CoreDataManager.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import CoreData

final class CoreDataManager {

    static let shared = CoreDataManager(modelName: "Model")

    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    private let persistentContainer: NSPersistentContainer

    private init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)

        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data store failed to load: \(error)")
            }
        }
    }
}
