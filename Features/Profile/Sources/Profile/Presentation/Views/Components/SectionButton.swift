//
//  SectionCardView.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

import SwiftUI
import CommonUI

struct SectionButton: View {
    
    let title: String
    let showsChevron: Bool
    let systemImage: String
    let handler: () -> Void
    
    init(
        title: String,
        systemImage: String,
        showsChevron: Bool = true,
        handler: @escaping () -> Void
    ) {
        self.title = title
        self.showsChevron = showsChevron
        self.systemImage = systemImage
        self.handler = handler
    }
    
    var body: some View {
        Button(action: handler) {
            HStack {
                HStack {
                    Image(systemName: systemImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: Constants.SectionIcon.size, height: Constants.SectionIcon.size)
                    
                    Text(title)
                        .padding(.leading, Constants.SectionTitle.insetLeading)
                        .font(Fonts.paragraphExtraLarge)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if showsChevron {
                    Image(systemName: Constants.ChevronIcon.imageName)
                        .padding(.trailing, Constants.ChevronIcon.insetTrailing)
                        .font(.body.bold())
                }
            }
            .padding(.leading, Constants.insetLeading)
            .frame(height: Constants.height)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(Colors.appDark.swiftUIColor)
        }
        .overlay {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .stroke(Colors.appDark.swiftUIColor)
        }
    }
}

// MARK: - Constants

private extension SectionButton {
    
    enum Constants {
        static let height: CGFloat = 85
        static let insetLeading: CGFloat = 30
        static let cornerRadius: CGFloat = 14
        
        enum SectionTitle {
            static let insetLeading: CGFloat = 5
        }
        
        enum SectionIcon {
            static let size: CGFloat = 30
        }
        
        enum ChevronIcon {
            static let insetTrailing: CGFloat = 30
            static let imageName = "chevron.right"
        }
    }
}
