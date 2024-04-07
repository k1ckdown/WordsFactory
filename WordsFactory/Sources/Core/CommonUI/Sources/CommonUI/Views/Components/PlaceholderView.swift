//
//  PlaceholderView.swift
//
//
//  Created by Ivan Semenov on 27.03.2024.
//

import SwiftUI

public struct PlaceholderView: View {
    
    let title: String
    let subtitle: String
    
    public init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
    
    public var body: some View {
        VStack(spacing: Constants.imageSpacing) {
            Images.dictionaryPlaceholder.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(height: Constants.imageHeight)
            
            VStack(spacing: Constants.textSpacing) {
                Text(title)
                    .font(Fonts.headline4)
                    .foregroundStyle(Colors.appDark.swiftUIColor)
                
                Text(subtitle)
                    .font(Fonts.paragraphMedium)
                    .foregroundStyle(Colors.appDarkGray.swiftUIColor)
            }
        }
    }
}

// MARK: - Constants

private extension PlaceholderView {
    
    enum Constants {
        static let textSpacing: CGFloat = 8
        static let imageSpacing: CGFloat = 32
        static let imageHeight: CGFloat = 253
    }
}
