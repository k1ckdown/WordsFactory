//
//  MeaningDefinitionCardViewModel.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import Foundation
import CommonUI
import WordModuleAPI

struct MeaningDefinitionCardViewModel: Identifiable, Equatable {
    let id = UUID()
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
    static func placeholder(id: String) -> MeaningDefinitionCardViewModel {
        .init(definition: .placeholder(80), example: .placeholder(20))
    }
}
