//
//  DictionaryWidgetEntryView.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

import SwiftUI
import CommonUI

struct DictionaryWidgetEntryView: View {

    let entry: DictionaryWidgetProvider.Entry

    var body: some View {
        VStack(spacing: .zero) {
            titleView

            VStack {
                totalWordsView(name: "My Dictionary", count: entry.totalWordCount)
                totalWordsView(name: "I already remember", count: entry.rememberedWordCount)
            }
            .padding(.top, Constants.totalWordsInsetTop)
            .padding([.bottom, .horizontal])
            .frame(maxHeight: .infinity)
        }
        .widgetBackground()
    }
}

// MARK: - Content

private extension DictionaryWidgetEntryView {

    var titleView: some View {
        ZStack(alignment: .leading) {
            LinearGradient(
                colors: [Colors.appOrange.swiftUIColor, Colors.appYellow.swiftUIColor],
                startPoint: .leading,
                endPoint: .trailing
            )

            Text("WordsFactory")
                .font(Fonts.headline3)
                .foregroundStyle(.white)
                .padding(.leading)
        }
        .frame(height: Constants.titleHeight)
    }

    func totalWordsView(name: String, count: Int) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: .zero) {
            Text(name)
                .font(Fonts.headline5)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("\(count) Words")
                .font(Fonts.paragraphMedium)
                .foregroundStyle(.gray)
                .padding(.top, Constants.wordsLabelInsetTop)
        }
    }
}

// MARK: - Constants

private extension DictionaryWidgetEntryView {

    enum Constants {
        static let titleHeight: CGFloat = 51
        static let totalWordsInsetTop: CGFloat = 10
        static let wordsLabelInsetTop: CGFloat = 12
    }
}
