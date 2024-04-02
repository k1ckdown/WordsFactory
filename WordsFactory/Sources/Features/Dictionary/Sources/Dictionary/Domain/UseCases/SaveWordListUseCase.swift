//
//  SaveWordListUseCase.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

final class SaveWordListUseCase {

    private let wordRepository: WordRepository

    init(wordRepository: WordRepository) {
        self.wordRepository = wordRepository
    }

    func execute(_ list: [Word]) throws {
        try wordRepository.save(list)
    }
}
