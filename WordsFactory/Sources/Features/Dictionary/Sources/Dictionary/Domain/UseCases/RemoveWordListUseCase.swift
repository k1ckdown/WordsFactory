//
//  RemoveWordListUseCase.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

final class RemoveWordListUseCase {

    private let wordRepository: WordRepository

    init(wordRepository: WordRepository) {
        self.wordRepository = wordRepository
    }

    func execute(_ word: String) throws {
        try wordRepository.remove(by: word)
    }
}
