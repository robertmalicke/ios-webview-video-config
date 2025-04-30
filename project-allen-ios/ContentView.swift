//
//  ContentView.swift
//  project-allen-ios
//
//  Created by Robert Malicke on 4/29/25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.mediaTypesRequiringUserActionForPlayback = []
        // When this line is set to false, the native iOS player overrides the nextjs browser video player experience
        // When this line is set to true, the iOS app allows the nextjs browser to play our custom video experience
        configuration.allowsInlineMediaPlayback = true
        
        // This helps ensure proper video rendering
        if #available(iOS 14.0, *) {
            configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        }
        
        // Create and return the configured WebView
        let webView = WKWebView(frame: .zero, configuration: configuration)
        

        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1"
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct ContentView: View {
    var body: some View {
        WebView(url: URL(string: "https://centura-sweng-project-allen-dev.azurewebsites.net/")!)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
