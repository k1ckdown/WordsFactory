//
//  CoreDataContextProvider.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import CoreData

final class CoreDataContextProvider {

    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    private lazy var persistentContainer: NSPersistentContainer = {
        guard
            let modelUrl = Bundle.module.url(forResource: Constants.modelName, withExtension: Constants.modelExtension),
            let model = NSManagedObjectModel(contentsOf: modelUrl)
        else { fatalError("Failed to create ManagedObjectModel") }

        let persistentContainer = NSPersistentContainer(name: Constants.modelName, managedObjectModel: model)
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }

        return persistentContainer
    }()
}

// MARK: - Constants

private extension CoreDataContextProvider {

    enum Constants {
        static let modelName = "Word"
        static let modelExtension = "momd"
    }
}
