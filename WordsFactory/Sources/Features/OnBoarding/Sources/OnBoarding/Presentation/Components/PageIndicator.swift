//
//  PageIndicator.swift
//
//
//  Created by Ivan Semenov on 20.03.2024.
//

import SwiftUI
import CommonUI

struct PageIndicator: View {

    let page: Int
    let numberOfPages: Int

    init(_ page: Int, numberOfPages: Int = Constants.defaultNumberOfPages) {
        self.page = page
        self.numberOfPages = numberOfPages
    }

    var body: some View {
        HStack(spacing: Constants.spacing) {
            ForEach(1...numberOfPages, id: \.self) { index in
                indicatorView(for: index)
            }
        }
        .frame(height: Constants.size)
    }

    @ViewBuilder
    private func indicatorView(for index: Int) -> some View {
        if index == page {
            Capsule()
                .fill(Colors.appBlue.swiftUIColor)
                .frame(width: Constants.selectedWidth)
        } else {
            Circle()
                .fill(Colors.appGray.swiftUIColor)
                .frame(width: Constants.size)
        }
    }
}

// MARK: - Constants

private extension PageIndicator {

    enum Constants {
        static let size: CGFloat = 6
        static let spacing: CGFloat = 10
        static let selectedWidth: CGFloat = 16
        static let defaultNumberOfPages = 3
    }
}
