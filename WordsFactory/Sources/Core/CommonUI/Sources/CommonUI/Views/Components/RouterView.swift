//
//  RouterView.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

public struct RouterView<Route, Content, Destination>: View where Content: View,
                                                               Destination: View,
                                                               Route: Hashable,
                                                               Route: CaseIterable,
                                                               Route.AllCases == Array<Route> {
    let content: Content
    @Binding var selection: Route?
    let destination: (Route) -> Destination

    public init(
        selection: Binding<Route?>,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder destination: @escaping (Route) -> Destination
    ) {
        _selection = selection
        self.content = content()
        self.destination = destination
    }
    
    public var body: some View {
        ZStack {
            content

            ForEach(Route.allCases, id: \.self) { screen in
                NavigationLink(
                    tag: screen,
                    selection: $selection
                ) {
                    NavigationLazyView(destination(screen))
                } label: {
                    EmptyView()
                }
            }
        }
    }
}
