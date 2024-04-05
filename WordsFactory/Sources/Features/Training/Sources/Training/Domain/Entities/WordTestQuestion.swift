//
//  WordTestQuestion.swift
//
//
//  Created by Ivan Semenov on 01.04.2024.
//

struct WordTestQuestion: Hashable {
    let answerWord: TestWord
    let choices: [String: String]
}
