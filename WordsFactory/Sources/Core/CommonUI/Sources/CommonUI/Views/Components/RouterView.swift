//
//  RouterView.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

public struct RouterView<Route, Root, Destination>: View where Root: View,
                                                               Destination: View,
                                                               Route: Hashable,
                                                               Route: CaseIterable,
                                                               Route.AllCases == Array<Route> {
    let rootView: Root
    @Binding var selection: Route?
    let destination: (Route) -> Destination

    public init(
        selection: Binding<Route?>,
        @ViewBuilder rootView: @escaping () -> Root,
        @ViewBuilder destination: @escaping (Route) -> Destination
    ) {
        _selection = selection
        self.rootView = rootView()
        self.destination = destination
    }
    
    public var body: some View {
        ZStack {
            rootView

            ForEach(Route.allCases, id: \.self) { screen in
                NavigationLink(
                    tag: screen,
                    selection: $selection
                ) {
                    destination(screen)
                } label: {
                    EmptyView()
                }
            }
        }
    }
}
