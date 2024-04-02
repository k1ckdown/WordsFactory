//
//  WordLocalDataSource.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import CoreData
import WordModuleAPI

final class WordLocalDataSource {

    private let contextProvider: CoreDataContextProvider

    init(contextProvider: CoreDataContextProvider) {
        self.contextProvider = contextProvider
    }
}

// MARK: - Public methods

extension WordLocalDataSource {

    func save(_ words: [Word]) throws {
        CDWord.insert(words, context: contextProvider.context)
        try contextProvider.context.save()
    }

    func remove(by text: String) throws {
        guard let fetchRequest = getFetchRequest(by: text) as? NSFetchRequest<NSFetchRequestResult> else { return }

        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try contextProvider.context.execute(deleteRequest)
    }

    func fetchAll(by text: String) throws -> [Word] {
        let fetchRequest = getFetchRequest(by: text)
        let cdDefinitions = try contextProvider.context.fetch(fetchRequest)

        return cdDefinitions.map { $0.toDomain() }
    }
}

// MARK: - Private methods

private extension WordLocalDataSource {

    func getFetchRequest(by text: String) -> NSFetchRequest<CDWord> {
        let fetchRequest = CDWord.fetchRequest()
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
