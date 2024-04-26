//
//  VideoView.swift
//
//
//  Created by Ivan Semenov on 31.03.2024.
//

import SwiftUI

struct VideoView: View {

    var body: some View {
        if let url = URL(string: Constants.urlString) {
            WebView(url: url)
                .ignoresSafeArea()
        }
    }
}

// MARK: - Constants

private extension VideoView {

    enum Constants {
        static let urlString = "https://learnenglish.britishcouncil.org/general-english/video-zone"
    }
}
