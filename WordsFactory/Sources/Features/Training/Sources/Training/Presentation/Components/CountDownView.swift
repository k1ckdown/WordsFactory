//
//  CountDownView.swift
//
//
//  Created by Ivan Semenov on 31.03.2024.
//

import SwiftUI
import CommonUI

struct CountDownView: View {

    let total: Double
    @Binding var counter: Double

    private let timer = Timer.publish(every: Constants.interval, on: .main, in: .common).autoconnect()

    var body: some View {
        Text(counter.isZero ? "\(Strings.go)!" : "\(Int(counter))")
            .font(Fonts.headline1)
            .frame(width: Constants.size, height: Constants.size)
            .overlay {
                Circle()
                    .trim(from: 0, to: CGFloat(counter / total))
                    .stroke(style: StrokeStyle(lineWidth: Constants.borderWidth, lineCap: .round))
                    .rotationEffect(.degrees(Constants.degrees))
                    .animation(.linear(duration: Constants.interval), value: counter)
            }
            .foregroundStyle(color)
            .onReceive(timer) { _ in
                withAnimation { counter -= Constants.interval }
                if counter.isZero { cancelTimer() }
            }
            .onDisappear {
                cancelTimer()
            }
    }

    private var color: Color {
        let asset: ColorAsset = switch counter / total {
        case 0.8..<1: Colors.appBlue
        case 0.6..<0.8: Colors.appGreen
        case 0.4..<0.6: Colors.appYellow
        case 0.2..<0.4: Colors.appRed
        case 0..<0.2, 1: Colors.appOrange
        default: Colors.appOrange
        }

        return asset.swiftUIColor
    }

    private func cancelTimer() {
        timer.upstream.connect().cancel()
    }
}

// MARK: - Constants

private extension CountDownView {

    enum Constants {
        static let size: CGFloat = 110
        static let interval: Double = 1
        static let degrees: CGFloat = 270
        static let borderWidth: CGFloat = 7
    }
}
