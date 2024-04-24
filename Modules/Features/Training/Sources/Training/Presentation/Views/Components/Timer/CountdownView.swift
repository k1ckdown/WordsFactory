//
//  CountdownView.swift
//
//
//  Created by Ivan Semenov on 31.03.2024.
//

import SwiftUI
import CommonUI

struct CountdownView: View {

    @ObservedObject var viewModel: TimerViewModel

    init(viewModel: TimerViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Circle()
            .trim(from: 0, to: viewModel.fractionRemained)
            .stroke(style: StrokeStyle(lineWidth: Constants.borderWidth, lineCap: .round))
            .rotationEffect(.degrees(Constants.degrees))
            .animation(.linear, value: viewModel.progress)
            .overlay {
                Text(Int(viewModel.progress) == 0 ? "\(Strings.go)!" : "\(Int(viewModel.progress))")
                    .font(Fonts.headline1)
            }
            .foregroundStyle(color)
    }

    private var color: Color {
        let asset: ColorAsset = switch viewModel.fractionRemained {
        case 0.8..<1: Colors.appBlue
        case 0.6..<0.8: Colors.appGreen
        case 0.4..<0.6: Colors.appYellow
        case 0.2..<0.4: Colors.appRed
        case 0..<0.2, 1: Colors.appOrange
        default: Colors.appOrange
        }

        return asset.swiftUIColor
    }
}

// MARK: - Constants

private extension CountdownView {

    enum Constants {
        static let degrees: CGFloat = 270
        static let borderWidth: CGFloat = 7
    }
}
