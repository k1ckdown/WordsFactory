//
//  CoreDataProvider.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import CoreData

final class CoreDataProvider {

    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    private let persistentContainer: NSPersistentContainer

    init() {
        guard
            let modelUrl = Bundle.module.url(forResource: Constants.modelName, withExtension: Constants.modelExtension),
            let model = NSManagedObjectModel(contentsOf: modelUrl)
        else { fatalError("Failed to create ManagedObjectModel") }

        persistentContainer = NSPersistentContainer(name: Constants.modelName, managedObjectModel: model)
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
    }
}

// MARK: - Constants

private extension CoreDataProvider {

    enum Constants {
        static let modelName = "Model"
        static let modelExtension = "momd"
    }
}
