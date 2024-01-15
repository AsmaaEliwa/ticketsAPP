//
//  TickerChangesView.swift
//  ticketsAPP
//
//  Created by asmaa gamal  on 15/01/2024.
//

import SwiftUI

struct TickerChangesView: View {
    @ObservedObject var networkManger:NetworkManger
    init(){
        networkManger = NetworkManger.shared
    }
    var body: some View {
        VStack {
            if let dataModel = networkManger.Changes {
                Text("Symbol: \(dataModel.displaySymbol)")
                Text("Last Price: \(dataModel.last)")
                Text("High: \(dataModel.high)")
                Text("Low: \(dataModel.low)")
                
                
            }
        }
    }
}
#Preview {
    TickerChangesView()
}
