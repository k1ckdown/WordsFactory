//
//  WordDefinitionLocalDataSource.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import CoreData

final class WordDefinitionLocalDataSource {

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func saveDefinitions(_ definitions: [WordDefinition]) throws {
        CDWordDefinition.insert(definitions, context: context)
        try context.save()
    }

    func deleteDefinitions(of word: String) throws {
        guard let fetchRequest = getFetchRequest(by: word) as? NSFetchRequest<NSFetchRequestResult> else { return }

        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try context.execute(deleteRequest)
    }

    func fetchDefinitionList(of word: String) throws -> [WordDefinition] {
        let fetchRequest = getFetchRequest(by: word)
        let cdDefinitions = try context.fetch(fetchRequest)

        return cdDefinitions.map { $0.toDomain() }
    }
}

private extension WordDefinitionLocalDataSource {

    func getFetchRequest(by word: String) -> NSFetchRequest<CDWordDefinition> {
        let fetchRequest = CDWordDefinition.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: Constants.wordPredicate, word.lowercased())
        return fetchRequest
    }
}

// MARK: - Constants

private extension WordDefinitionLocalDataSource {

    enum Constants {
        static let wordPredicate = "word = %@"
    }
}
