//
//  LinearTimerView.swift
//
//
//  Created by Ivan Semenov on 01.04.2024.
//

import SwiftUI
import CommonUI

struct LinearTimerView: View {

    @ObservedObject var viewModel: TimerViewModel

    var body: some View {
        ProgressView(value: viewModel.fractionRemained)
            .gradientProgressStyle([
                Colors.appRed.swiftUIColor,
                Colors.appOrange.swiftUIColor,
                Colors.appYellow.swiftUIColor
            ])
            .animation(.linear, value: viewModel.progress)
    }
}
