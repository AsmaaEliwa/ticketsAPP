//
//  ALLTickerDataView.swift
//  ticketsAPP
//
//  Created by asmaa gamal  on 15/01/2024.
//

import SwiftUI

struct ALLTickerDataView: View {
    @ObservedObject var networkManger:NetworkManger
    init(){
        networkManger = NetworkManger.shared
    }
    var body: some View {
        VStack {
               if networkManger.alldata.isEmpty {
                   Text("Loading data...")
               } else {
                   List {
                       ForEach(Array(networkManger.alldata.keys), id: \.self) { symbol in
                           if let currencyPair = networkManger.alldata[symbol] {
                               NavigationLink(destination: CurrencyPairDetailView(currencyPair: currencyPair)) {
                                   Text("Symbol: \(symbol), Last Price: \(currencyPair.last ?? 0.0)")
                               }
                           }
                       }
                   }
               }
           }
    }
}

#Preview {
    ALLTickerDataView()
}


struct CurrencyPairDetailView: View {
    var currencyPair: CurrencyPair

    var body: some View {
        // Add your details view here using currencyPair data
        VStack {
            Text("Symbol: \(currencyPair.displaySymbol ?? "")")
            Text("Last Price: \(currencyPair.last ?? 0.0)")
            // Add more details as needed
        }
        .navigationTitle("Currency Pair Detail")
    }
}
