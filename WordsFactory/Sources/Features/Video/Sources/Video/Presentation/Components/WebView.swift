//
//  WebView.swift
//
//
//  Created by Ivan Semenov on 31.03.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    let url: URL

    func makeCoordinator() -> Coordinator {
        Coordinator(url: url)
    }

    func makeUIView(context: Context) -> WKWebView {
        let wkWebView = WKWebView()

        wkWebView.allowsLinkPreview = false
        wkWebView.allowsBackForwardNavigationGestures = true
        wkWebView.navigationDelegate = context.coordinator

        return wkWebView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let urlRequest = URLRequest(url: url)
        uiView.load(urlRequest)
    }
}

// MARK: - Coordinator

extension WebView {

    final class Coordinator: NSObject, WKNavigationDelegate {

        private let url: URL

        init(url: URL) {
            self.url = url
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            guard let redirectedUrl = navigationAction.request.url else { return }

            let policy: WKNavigationActionPolicy = redirectedUrl.absoluteString.hasPrefix(url.absoluteString) ? .allow : .cancel
            decisionHandler(policy)
        }
    }
}
