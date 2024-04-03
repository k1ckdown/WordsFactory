//
//  NavigationLazyView.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {

    let content: () -> Content

    init(_ content: @autoclosure @escaping () -> Content) {
        self.content = content
    }
    var body: Content {
        content()
    }
}
