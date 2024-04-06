//
//  MainTabView.swift
//
//
//  Created by Ivan Semenov on 06.04.2024.
//

import SwiftUI
import CommonUI

struct MainTabView<Tab: TabProtocol, Content: View>: View {

    let content: () -> Content
    @Binding var selection: Tab

    init(selection: Binding<Tab>, @ViewBuilder content: @escaping () -> Content) {
        _selection = selection
        self.content = content
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selection) {
                content()
            }

            HStack(spacing: .zero) {
                ForEach(Tab.allCases) { tab in
                    TabBarItem(tag: tab, selection: $selection)
                }
            }
            .frame(height: Constants.height)
            .frame(maxWidth: .infinity)
            .background(background)
        }
        .ignoresSafeArea()
    }

    @ViewBuilder
    private var background: some View {
        let rectangle = RoundedRectangle(cornerRadius: Constants.cornerRadius)

        rectangle
            .stroke(Colors.appGray.swiftUIColor)
            .background(rectangle.fill(.white))
    }
}

// MARK: - Constants

private extension MainTabView {

    enum Constants {
        static var height: CGFloat { 98 }
        static var cornerRadius: CGFloat { 17 }
    }
}
