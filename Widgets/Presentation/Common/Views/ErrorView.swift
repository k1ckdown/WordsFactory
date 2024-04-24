//
//  ErrorView.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 24.04.2024.
//

import SwiftUI
import CommonUI

struct ErrorView: View {

    let message: String
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(.lightGray), Colors.appRed.swiftUIColor],
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )

            Text(message)
                .font(Fonts.headline5)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}
