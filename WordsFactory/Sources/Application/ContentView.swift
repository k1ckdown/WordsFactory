//
//  ContentView.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 18.03.2024.
//

import SwiftUI
import Auth

struct ContentView: View {

    var body: some View {
        AuthCoordinator()
            .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
