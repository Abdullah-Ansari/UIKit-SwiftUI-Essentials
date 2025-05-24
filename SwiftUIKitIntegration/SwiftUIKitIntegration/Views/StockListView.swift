//
//  StockListView.swift
//  SwiftUIKitIntegration
//
//  Created by Abdullah Ansari on 24/05/25.
//

import SwiftUI

struct Stock: Identifiable {
    let name: String
    let price: Double
    let id = UUID()
}

struct StockListView: View {
    
    let stocks = [
        Stock(name: "MSFT", price: 250),
        Stock(name: "AAPL", price: 104.56),
        Stock(name: "TSLA", price: 450),
        Stock(name: "AMZN", price: 120.00),
        
    ]
    
    var body: some View {
        List(stocks) { stock in
            HStack {
                Text(stock.name)
                Spacer()
                Text(stock.price, format: .currency(code: "USD"))
            }
            
        }
    }
}

#Preview {
    StockListView()
}
