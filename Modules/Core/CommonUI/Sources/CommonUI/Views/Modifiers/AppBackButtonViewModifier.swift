//
//  AppBackButtonViewModifier.swift
//
//
//  Created by Ivan Semenov on 05.04.2024.
//

import SwiftUI

struct AppBackButtonViewModifier: ViewModifier {

    let action: (() -> Void)?
    let backHandler: (() -> Void)?
    @Environment(\.dismiss) private var dismiss

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        action?()
                        backHandler?() ?? dismiss()
                    } label: {
                        Images.arrowLeftIcon.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: Constants.iconSize, height: Constants.iconSize)
                            .alignmentGuide(HorizontalAlignment.center) { dimension in
                                dimension[HorizontalAlignment.center]
                            }
                    }
                    .frame(width: Constants.buttonSize, height: Constants.buttonSize)
                    .clipShape(.circle)
                    .overlay {
                        Circle().stroke(Colors.appGray.swiftUIColor)
                    }
                }
            }
    }
}

// MARK: - Constants

private extension AppBackButtonViewModifier {

    enum Constants {
        static let iconSize: CGFloat = 13
        static let buttonSize: CGFloat = 40
    }
}

public extension View {
    func appBackButton(backHandler: (() -> Void)? = nil, action: (() -> Void)? = nil) -> some View {
        modifier(AppBackButtonViewModifier(action: action, backHandler: backHandler))
    }
}
