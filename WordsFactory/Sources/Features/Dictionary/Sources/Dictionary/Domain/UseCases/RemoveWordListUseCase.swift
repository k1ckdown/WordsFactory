//
//  RemoveWordListUseCase.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import WordModuleAPI

final class RemoveWordListUseCase {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    func execute(_ word: String) throws {
        try wordRepository.remove(by: word)
    }
}
