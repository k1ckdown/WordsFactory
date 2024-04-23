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
        contentView
            .widgetBackground()
    }

    @ViewBuilder
    private var contentView: some View {
        switch entry.state {
        case .failed(let error):
            errorView(error)
        case .loaded(let viewData):
            loadedView(viewData)
        }
    }
}

// MARK: - Content

private extension DictionaryWidgetEntryView {

    func errorView(_ error: Error) -> some View {
        Text("An error has occurred❗️\nData is not available.")
            .font(Fonts.headline5)
            .multilineTextAlignment(.center)
            .foregroundStyle(Color(.label))
            .padding()
    }

    func loadedView(_ viewData: DictionaryWidgetEntry.ViewState.ViewData) -> some View {
        VStack(spacing: .zero) {
            headerView()

            overviewView(totalWordCount: viewData.totalWordCount, rememberedWordCount: viewData.rememberedWordCount)
                .padding(.top, Constants.contentInsetTop)
                .padding([.bottom, .horizontal])
                .frame(maxHeight: .infinity)
        }
    }

    @ViewBuilder
    func overviewView(totalWordCount: Int, rememberedWordCount: Int) -> some View {
        if totalWordCount > 0 {
            VStack {
                totalWordsView(name: Strings.myDictionary, count: totalWordCount)
                totalWordsView(name: Strings.alreadyRemember, count: rememberedWordCount)
            }
        } else {
            placeholderView()
        }
    }
    func placeholderView() -> some View {
        Text(Strings.dictionaryIsEmpty)
            .font(Fonts.headline5)
            .multilineTextAlignment(.center)
    }

    func headerView() -> some View {
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
