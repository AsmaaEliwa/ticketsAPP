//
//  NetworkManger.swift
//  ticketsAPP
//
//  Created by asmaa gamal  on 15/01/2024.
//

import Foundation
class NetworkManger:ObservableObject{
    static let shared = NetworkManger()
    @Published var alldata :[String: CurrencyPair] = [:]
    private init(){
        getAllTicketData()
    }
    func getAllTicketData(){
        let url = "https://bitcoinaverage-global-ethereum-index-v1.p.rapidapi.com/indices/local/ticker/all"
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        APIManger.shared.getRequest(url: url) { data in
            if let jsonData = data{
                do {
                    let result =  try decoder.decode([String: CurrencyPair].self, from: jsonData)
                    DispatchQueue.main.sync{
                        self.alldata = result
                    }
                    for (symbol, currencyPair) in result {
                                          print("Symbol: \(symbol), Last Price: \(currencyPair.last ?? 0.0)")
                                      }
                    
                }catch{
                    print(error)
                    
                }
            }
        }
    }
}
