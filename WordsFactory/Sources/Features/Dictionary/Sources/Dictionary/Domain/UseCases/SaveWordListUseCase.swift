//
//  SaveWordListUseCase.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import WordModuleAPI

final class SaveWordListUseCase {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    func execute(_ list: [Word]) throws {
        try wordRepository.save(list)
    }
}
