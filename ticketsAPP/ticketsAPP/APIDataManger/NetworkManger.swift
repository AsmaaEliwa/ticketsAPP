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
    @Published var Changes: ChangeModel?
    private init(){
        getAllTicketData()
        getAllTickerChanges()
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
             
                    
                }catch{
                    print(error)
                    
                }
            }
        }
    }
    
    
    func getAllTickerChanges(){
        let url = "https://bitcoinaverage-global-ethereum-index-v1.p.rapidapi.com/indices/local/ticker/ETHUSD/changes"
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        APIManger.shared.getRequest(url: url) { data in
            
            if let jsonData = data{
                do {
                    let result =  try decoder.decode(ChangeModel.self, from: jsonData)
                    
                    DispatchQueue.main.sync{
                        self.Changes = result
                        
                    }
           
                }catch{
                    print(error)
                    
                }
            }
        }
    }
    
    
    
}
