//
//  PhoneticItemView.swift
//
//
//  Created by Ivan Semenov on 07.04.2024.
//

import SwiftUI
import CommonUI

struct PhoneticItemView: View {

    let viewModel: PhoneticItemViewModel

    var body: some View {
        HStack(spacing: Constants.contentSpacing) {
            Text(viewModel.text)

            if viewModel.isSpeakerShowing {
                Button {
                    viewModel.tapHandler?()
                } label: {
                    Images.speakerIcon.swiftUIImage
                }
            }
        }
        .font(Fonts.paragraphMedium)
        .foregroundStyle(Colors.appOrange.swiftUIColor)
    }
}

// MARK: - Constants

private extension PhoneticItemView {

    enum Constants {
        static let contentSpacing: CGFloat = 10
    }
}
