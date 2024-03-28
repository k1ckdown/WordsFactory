//
//  MeaningDefinitionCardViewModel.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import CommonUI

struct MeaningDefinitionCardViewModel: Hashable {
    let definition: String
    let example: String?
}

extension MeaningDefinitionCardViewModel {
    init(_ meaningDefinition: MeaningDefinition) {
        definition = meaningDefinition.definition
        example = meaningDefinition.example
    }
}

// MARK: - Placeholder

extension MeaningDefinitionCardViewModel: HasPlaceholder {
    static func placeholder<T: Hashable>(id: T) -> MeaningDefinitionCardViewModel {
        .init(definition: .placeholder(80), example: .placeholder(20))
    }
}
