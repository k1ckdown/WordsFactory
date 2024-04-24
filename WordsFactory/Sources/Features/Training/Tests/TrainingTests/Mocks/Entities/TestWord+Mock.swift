//
//  TestWord.swift
//
//
//  Created by Ivan Semenov on 24.04.2024.
//

@testable import Training

extension TestWord {
    static func mock(studyCoefficient: Int) -> Self {
        TestWord(
            answerKey: "A",
            text: "word",
            definition: "definition",
            studyCoefficient: studyCoefficient
        )
    }
}
