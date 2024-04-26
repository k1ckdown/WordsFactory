//
//  TabBarItem.swift
//
//
//  Created by Ivan Semenov on 06.04.2024.
//

import SwiftUI
import CommonUI

struct TabBarItem<Tab: TabProtocol>: View {

    let tag: Tab
    @Binding var selection: Tab

    var body: some View {
        Button {
            selection = tag
        } label: {
            VStack {
                tag.icon
                    .renderingMode(.template)
                    .frame(width: Constants.iconSize, height: Constants.iconSize)

                Text(tag.title)
                    .font(Fonts.paragraphMedium)
            }
            .foregroundStyle((selection == tag ? Colors.appOrange : Colors.appGray).swiftUIColor)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .offset(y: Constants.offsetY)
        }
    }
}

// MARK: - Constants

private extension TabBarItem {

    enum Constants {
        static var offsetY: CGFloat { -7 }
        static var iconSize: CGFloat { 20 }
    }
}
