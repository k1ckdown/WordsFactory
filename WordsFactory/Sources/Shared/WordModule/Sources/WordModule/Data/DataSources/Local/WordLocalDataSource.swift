//
//  WordLocalDataSource.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import CoreData
import WordModuleAPI

final class WordLocalDataSource {

    private let coreDataStack: CoreDataStackProtocol

    init(coreDataStack: CoreDataStackProtocol = CoreDataStack.shared) {
        self.coreDataStack = coreDataStack
    }
}

// MARK: - Public methods

extension WordLocalDataSource {

    func fetchAllDictionary() async throws -> [DictionaryWord] {
        try await withCheckedThrowingContinuation { continuation in
            coreDataStack.performBackgroundTask { context in
                do {
                    let cdWordList = try context.fetch(CDWord.fetchRequest())
                    continuation.resume(returning: cdWordList.map { $0.toDomainDictionary() })
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func fetch(by text: String) async throws -> Word? {
        try await withCheckedThrowingContinuation { continuation in
            coreDataStack.performBackgroundTask { context in
                do {
                    let cdWord = try self.fetch(by: text, in: context)
                    continuation.resume(returning: cdWord?.toDomain())
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func saveDictionary(_ word: Word) async throws {
        try await withCheckedThrowingContinuation { continuation in
            coreDataStack.performBackgroundTask { context in
                do {
                    if try self.fetch(by: word.text, in: context) == nil {
                        let _ = CDWord(word, context: context)
                        try context.save()
                    }
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func removeDictionary(by text: String) async throws {
        try await withCheckedThrowingContinuation { continuation in
            coreDataStack.performBackgroundTask { context in
                do {
                    if let cdWord = try self.fetch(by: text, in: context) {
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

    func updateStudyCoefficient(_ coefficient: Int, of wordText: String) async throws {
        try await withCheckedThrowingContinuation { continuation in
            coreDataStack.performBackgroundTask { context in
                do {
                    if let cdWord = try self.fetch(by: wordText, in: context) {
                        cdWord.studyCoefficient = Int64(truncatingIfNeeded: coefficient)
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

    func fetch(by text: String, in context: NSManagedObjectContext) throws -> CDWord? {
        try context.fetch(getFetchRequest(by: text)).first
    }

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
