//
//  ColoredTextArgument.swift
//
//
//  Created by Ivan Semenov on 31.03.2024.
//

import SwiftUI

struct HighlightedText: View {

    let color: Color
    let components: [String]

    init(_ string: String, color: Color) {
        components = string.components(separatedBy: Constants.argumentSeparator)
        self.color = color
    }

    var body: some View {
        components.enumerated().reduce(into: Text("")) { result, pair in
            let isArgument = pair.offset.isMultiple(of: 2) == false
            let text = Text(pair.element).foregroundColor(isArgument ? color : Color(.label))
            result = result + text
        }
    }
}

// MARK: - Constants

private extension HighlightedText {

    enum Constants {
        static let argumentSeparator = "**"
    }
}
