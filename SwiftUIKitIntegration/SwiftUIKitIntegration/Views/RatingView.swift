//
//  RatingView.swift
//  SwiftUIKitIntegration
//
//  Created by Abdullah Ansari on 24/05/25.
//

import SwiftUI

class Rating: ObservableObject {
    @Published var value: Int? = 3
}

struct RatingViewContainer: View {
    
    @ObservedObject var rating: Rating
    
    var body: some View {
        RatingView(rating: $rating.value)
    }
}

struct RatingView: View {
    
    @Binding var rating: Int?
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: starType(index: index))
                    .foregroundColor(.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
    
    private func starType(index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
