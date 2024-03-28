//
//  ContentView.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 18.03.2024.
//

import SwiftUI
import Dictionary

struct ContentView: View {

    var body: some View {
        DictionaryViewAssembly.assemble()
            .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
