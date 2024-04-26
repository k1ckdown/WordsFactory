//
//  WordLocalDataSource.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import CoreData
import DictionaryDomain

final class WordLocalDataSource {

    private let coreDataStack: CoreDataStackProtocol

    init(coreDataStack: CoreDataStackProtocol = CoreDataStack.shared) {
        self.coreDataStack = coreDataStack
    }
}

// MARK: - Public methods

extension WordLocalDataSource {

    func isDictionary(_ userId: String, wordText: String) async throws -> Bool {
        try await withCheckedThrowingContinuation { continuation in
            coreDataStack.performBackgroundTask { context in
                do {
                    let isDictionary = try self.isDictionary(userId, wordText: wordText, in: context)
                    continuation.resume(returning: isDictionary)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func fetch(_ userId: String, by text: String) async throws -> Word? {
        try await withCheckedThrowingContinuation { continuation in
            coreDataStack.performBackgroundTask { context in
                do {
                    guard let cdWord = try self.fetchWord(by: text, in: context) else {
                        return continuation.resume(returning: nil)
                    }

                    let isDictionary = try self.isDictionary(userId, wordText: text, in: context)
                    continuation.resume(returning: cdWord.toDomain(isDictionary: isDictionary))
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func fetchAllDictionary(_ userId: String) async throws -> [DictionaryWord] {
        try await withCheckedThrowingContinuation { continuation in
            coreDataStack.performBackgroundTask { context in
                do {
                    let cdUserWords = try self.fetchAllUserWords(by: userId, in: context)
                    let cdWords = try self.fetchAllWords(for: cdUserWords, in: context)

                    let dictionaryWords = cdWords.map { word in
                        let studyCoefficient = cdUserWords.first(where: { $0.text ==  word.text})?.studyCoefficient ?? 0
                        return word.toDomainDictionary(studyCoefficient: Int(studyCoefficient))
                    }
                    continuation.resume(returning: dictionaryWords)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func removeDictionary(_ userId: String, by text: String) async throws {
        try await withCheckedThrowingContinuation { continuation in
            coreDataStack.performBackgroundTask { context in
                do {
                    if let cdWord = try self.fetchUserWord(userId, by: text, in: context) {
                        context.delete(cdWord)
                        try context.save()
                    }
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func saveDictionary(_ userId: String, word: Word) async throws {
        try await withCheckedThrowingContinuation { continuation in
            coreDataStack.performBackgroundTask { context in
                do {
                    let cdUserWord = CDUserWord(context: context)
                    cdUserWord.userId = userId
                    cdUserWord.text = word.text

                    if try self.fetchWord(by: word.text, in: context) == nil {
                        let _ = CDWord(word, context: context)
                    }

                    try context.save()
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func updateStudyCoefficient(_ userId: String, coefficient: Int, wordText: String) async throws {
        try await withCheckedThrowingContinuation { continuation in
            coreDataStack.performBackgroundTask { context in
                do {
                    if let cdUserWord = try self.fetchUserWord(userId, by: wordText, in: context) {
                        cdUserWord.studyCoefficient = Int64(truncatingIfNeeded: coefficient)
                        try context.save()
                    }
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

// MARK: - Private methods

private extension WordLocalDataSource {

    func isDictionary(_ userId: String, wordText: String, in context: NSManagedObjectContext) throws -> Bool {
        try fetchUserWord(userId, by: wordText, in: context) != nil
    }

    func fetchWord(by text: String, in context: NSManagedObjectContext) throws -> CDWord? {
        let fetchRequest = CDWord.fetchRequest()

        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: Constants.textPredicate, text)

        return try context.fetch(fetchRequest).first
    }

    func fetchUserWord(_ userId: String, by text: String, in context: NSManagedObjectContext) throws -> CDUserWord? {
        let fetchRequest = CDUserWord.fetchRequest()

        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: Constants.textUserIdPredicate, text, userId)

        return try context.fetch(fetchRequest).first
    }
    
    func fetchAllUserWords(by userId: String, in context: NSManagedObjectContext) throws -> [CDUserWord] {
        let fetchRequest = CDUserWord.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: Constants.userIdPredicate, userId)

        let cdUserWords = try context.fetch(fetchRequest)
        return cdUserWords
    }

    func fetchAllWords(for userWords: [CDUserWord], in context: NSManagedObjectContext) throws -> [CDWord] {
        let fetchRequest = CDWord.fetchRequest()
        let predicates = userWords.map { NSPredicate(format: Constants.textPredicate, $0.text) }
        fetchRequest.predicate = NSCompoundPredicate(orPredicateWithSubpredicates: predicates)

        let cdWords = try context.fetch(fetchRequest)
        return cdWords
    }
}

// MARK: - Constants

private extension WordLocalDataSource {

    enum Constants {
        static let textPredicate = "text =[c] %@"
        static let userIdPredicate = "userId = %@"
        static let textUserIdPredicate = "\(textPredicate) AND \(userIdPredicate)"
    }
}
