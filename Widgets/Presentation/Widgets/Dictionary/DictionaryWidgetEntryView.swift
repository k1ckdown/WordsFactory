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
            headerView

            contentView
                .padding(.top, Constants.contentInsetTop)
                .padding([.bottom, .horizontal])
                .frame(maxHeight: .infinity)
        }
        .widgetBackground()
    }

    @ViewBuilder
    private var contentView: some View {
        if entry.totalWordCount > 0 {
            wordCountView
        } else {
            placeholderView
        }
    }
}

// MARK: - Content

private extension DictionaryWidgetEntryView {

    var headerView: some View {
        ZStack(alignment: .leading) {
            LinearGradient(
                colors: [Colors.appOrange.swiftUIColor, Colors.appYellow.swiftUIColor],
                startPoint: .leading,
                endPoint: .trailing
            )

            Text(Strings.appName)
                .font(Fonts.headline3)
                .foregroundStyle(.white)
                .padding(.leading)
        }
        .frame(height: Constants.titleHeight)
    }

    var placeholderView: some View {
        Text(Strings.dictionaryIsEmpty)
            .font(Fonts.headline5)
            .multilineTextAlignment(.center)
    }

    var wordCountView: some View {
        VStack {
            totalWordsView(name: Strings.myDictionary, count: entry.totalWordCount)
            totalWordsView(name: Strings.alreadyRemember, count: entry.rememberedWordCount)
        }
    }

    func totalWordsView(name: String, count: Int) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: .zero) {
            Text(name)
                .font(Fonts.headline5)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(Strings.words(count))
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
        static let contentInsetTop: CGFloat = 10
        static let wordsLabelInsetTop: CGFloat = 12
    }
}
