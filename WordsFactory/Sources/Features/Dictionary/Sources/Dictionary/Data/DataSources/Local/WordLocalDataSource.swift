//
//  WordLocalDataSource.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import CoreData

final class WordLocalDataSource {

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

// MARK: - Public methods

extension WordLocalDataSource {

    func save(_ words: [Word]) throws {
        CDWordDefinition.insert(words, context: context)
        try context.save()
    }

    func remove(by text: String) throws {
        guard let fetchRequest = getFetchRequest(by: text) as? NSFetchRequest<NSFetchRequestResult> else { return }

        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try context.execute(deleteRequest)
    }

    func fetchAll(by text: String) throws -> [Word] {
        let fetchRequest = getFetchRequest(by: text)
        let cdDefinitions = try context.fetch(fetchRequest)

        return cdDefinitions.map { $0.toDomain() }
    }
}

// MARK: - Private methods

private extension WordLocalDataSource {

    func getFetchRequest(by text: String) -> NSFetchRequest<CDWordDefinition> {
        let fetchRequest = CDWordDefinition.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: Constants.textPredicate, text.lowercased())
        return fetchRequest
    }
}

// MARK: - Constants

private extension WordLocalDataSource {

    enum Constants {
        static let textPredicate = "word = %@"
    }
}
