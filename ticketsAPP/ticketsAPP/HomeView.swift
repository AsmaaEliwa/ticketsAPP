//
//  HomeView.swift
//  ticketsAPP
//
//  Created by asmaa gamal  on 15/01/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var networkManger:NetworkManger
    @State var selectedView = 1
    init(){
        networkManger = NetworkManger.shared
    }
    var body: some View {
       
        TabView(selection: $selectedView) {
            ALLTickerDataView()
                .tabItem {
                    Image(systemName: "c.circle")
                  
                }
                .tag(1)
            
            TickerChangesView()
                .tabItem {
                    Image(systemName: "c.square")
                    
                }
                .tag(2)
            
        }
        
    }
}

#Preview {
    HomeView()
}
