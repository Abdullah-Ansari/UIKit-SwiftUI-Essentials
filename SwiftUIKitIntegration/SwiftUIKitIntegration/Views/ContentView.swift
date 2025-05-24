//
//  ContentView.swift
//  SwiftUIKitIntegration
//
//  Created by Abdullah Ansari on 24/05/25.
//

import SwiftUI
import UIKit

struct LoadingView: UIViewRepresentable {

    typealias UIViewType = UIActivityIndicatorView
    var loading: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if loading {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
    
}

struct ContentView: View {
    @State private var isLoading = false
    var body: some View {
        VStack {
            LoadingView(loading: isLoading)
            Button("Loading ") {
                self.isLoading.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
