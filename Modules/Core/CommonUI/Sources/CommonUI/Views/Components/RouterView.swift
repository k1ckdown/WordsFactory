//
//  RouterView.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

public struct RouterView<Route, Content, Destination>: View where Content: View,
                                                                  Destination: View,
                                                                  Route: Routable,
                                                                  Route.AllCases == Array<Route> {
    let content: () -> Content
    @Binding var selection: Route?
    let destination: (Route) -> Destination

    public init(
        selection: Binding<Route?>,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder destination: @escaping (Route) -> Destination
    ) {
        _selection = selection
        self.content = content
        self.destination = destination
    }

    public var body: some View {
        ZStack {
            content()

            ForEach(Route.allCases) { screen in
                NavigationLink(
                    tag: screen,
                    selection: activeLink
                ) {
                    NavigationLazyView(destination(screen))
                } label: {
                    EmptyView()
                }
            }
        }
    }

    private var activeLink: Binding<Route?> {
        Binding(
            get: { selection?.navigationLink },
            set: { selection = $0 }
        )
    }
}
