//
//  CoreDataStack.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import CoreData

final class CoreDataStack {

    static let shared = CoreDataStack()

    private lazy var persistentContainer: NSPersistentContainer = {
        guard
            let containerUrl = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: Constants.appGroupId),
            let modelUrl = Bundle.module.url(forResource: Constants.modelName, withExtension: Constants.modelExtension),
            let model = NSManagedObjectModel(contentsOf: modelUrl)
        else { fatalError("Failed to create ManagedObjectModel") }

        let persistentContainer = NSPersistentContainer(name: Constants.modelName, managedObjectModel: model)
        let storeUrl = containerUrl.appendingPathComponent(Constants.storePath)
        let description = NSPersistentStoreDescription(url: storeUrl)

        persistentContainer.persistentStoreDescriptions = [description]
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }

        return persistentContainer
    }()

    private init() {}
}

// MARK: - CoreDataStackProtocol

extension CoreDataStack: CoreDataStackProtocol {

    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        persistentContainer.performBackgroundTask(block)
    }
}

// MARK: - Constants

private extension CoreDataStack {

    enum Constants {
        static let modelName = "Word"
        static let modelExtension = "momd"
        static let appGroupId = "group.com.WordsFactory"
        static let storePath = Constants.modelName + ".sqlite"
    }
}
