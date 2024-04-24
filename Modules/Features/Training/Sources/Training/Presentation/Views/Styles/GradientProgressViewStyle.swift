//
//  GradientProgressViewStyle.swift
//
//
//  Created by Ivan Semenov on 01.04.2024.
//

import SwiftUI
import CommonUI

struct GradientProgressViewStyle: ProgressViewStyle {

    let colors: [Color]
    let maxTrackColor: Color

    let height: CGFloat
    let cornerRadius: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        maxTrackColor
            .overlay {
                GeometryReader { geometry in
                    LinearGradient(
                        colors: colors,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: (configuration.fractionCompleted ?? 0) * geometry.size.width)
                }
            }
            .frame(height: height)
            .clipShape(.rect(cornerRadius: cornerRadius))
    }
}

extension View {
    func gradientProgressStyle(
        _ colors: [Color],
        maxTrackColor: Color = Colors.appGray.swiftUIColor,
        height: CGFloat = 7,
        cornerRadius: CGFloat = 15
    ) -> some View {
        progressViewStyle(GradientProgressViewStyle(colors: colors, maxTrackColor: maxTrackColor, height: height, cornerRadius: cornerRadius))
    }
}
