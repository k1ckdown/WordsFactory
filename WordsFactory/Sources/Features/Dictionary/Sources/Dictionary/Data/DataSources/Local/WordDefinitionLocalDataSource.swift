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

    func saveDefinition(_ definition: WordDefinition) throws {
        CDWordDefinition.insert(definition, context: context)
        try context.save()
    }

    func fetchDefinitionList(of word: String) throws -> [WordDefinition] {
        let fetchRequest = CDWordDefinition.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: Constants.wordPredicate, word.lowercased())

        let cdDefinitions = try context.fetch(fetchRequest)
        return cdDefinitions.map { $0.toDomain() }
    }
}

// MARK: - Constants

private extension WordDefinitionLocalDataSource {

    enum Constants {
        static let wordPredicate = "word = %@"
    }
}
