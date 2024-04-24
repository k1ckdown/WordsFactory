//
//  DictionaryWordWidgetEntryView.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 24.04.2024.
//

import SwiftUI
import CommonUI

struct DictionaryWordWidgetEntryView: View {

    let entry: DictionaryWordWidgetEntry

    var body: some View {
        contentView
            .widgetBackground()
    }

    @ViewBuilder
    private var contentView: some View {
        switch entry.state {
        case .failed(let message):
            ErrorView(message: message)
        case .loaded(let viewData):
            loadedView(viewData)
        }
    }
}

// MARK: - Content

private extension DictionaryWordWidgetEntryView {

    var textGradient: LinearGradient {
        LinearGradient(
            colors: [Colors.appOrange.swiftUIColor, Colors.appDark.swiftUIColor],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    func wordView(_ word: String) -> some View {
        Text(word)
            .font(Fonts.headline4)
            .foregroundStyle(textGradient)
    }

    func definitionView(_ definition: String) -> some View {
        ZStack {
            textGradient
                .clipShape(.rect(cornerRadius: Constants.Definition.cornerRadius))
                .shadow(radius: Constants.Definition.shadowRadius)

            Text(definition)
                .padding(Constants.Definition.insets)
                .font(Fonts.paragraphLarge)
                .foregroundStyle(.white)
        }
    }

    func loadedView(_ viewData: DictionaryWordWidgetEntry.ViewState.ViewData) -> some View {
        ZStack {
            LinearGradient(
                colors: [.white, Color(.lightGray), Colors.appOrange.swiftUIColor],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            VStack(alignment: .leading) {
                wordView(viewData.word)
                definitionView(viewData.definition)
            }
            .padding()
        }
    }
}

// MARK: - Constants

private extension DictionaryWordWidgetEntryView {

    enum Constants {

        enum Definition {
            static let insets: CGFloat = 10
            static let shadowRadius: CGFloat = 7
            static let cornerRadius: CGFloat = 10
        }
    }
}

