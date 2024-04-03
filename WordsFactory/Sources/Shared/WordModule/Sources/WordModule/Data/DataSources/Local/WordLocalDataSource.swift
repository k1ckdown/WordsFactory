//
//  WordLocalDataSource.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import CoreData

final class WordLocalDataSource {

    private let contextProvider: CoreDataContextProvider

    init(contextProvider: CoreDataContextProvider) {
        self.contextProvider = contextProvider
    }
}

// MARK: - Public methods

extension WordLocalDataSource {

    func fetchAll() throws -> [CDWord] {
        try contextProvider.context.fetch(CDWord.fetchRequest())
    }

    func fetch(by text: String) throws -> CDWord? {
        let fetchRequest = getFetchRequest(by: text)
        return try contextProvider.context.fetch(fetchRequest).first
    }

    func save(_ wordProvider: CDModelProvider<CDWord>) throws {
        let _ = wordProvider(contextProvider.context)
        try contextProvider.context.save()
    }

    func remove(by text: String) throws {
        guard let fetchRequest = getFetchRequest(by: text) as? NSFetchRequest<NSFetchRequestResult> else { return }

        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try contextProvider.context.execute(deleteRequest)
    }
}

// MARK: - Private methods

private extension WordLocalDataSource {

    func getFetchRequest(by text: String) -> NSFetchRequest<CDWord> {
        let fetchRequest = CDWord.fetchRequest()

        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: Constants.textPredicate, text.lowercased())

        return fetchRequest
    }
}

// MARK: - Constants

private extension WordLocalDataSource {

    enum Constants {
        static let textPredicate = "text = %@"
    }
}
