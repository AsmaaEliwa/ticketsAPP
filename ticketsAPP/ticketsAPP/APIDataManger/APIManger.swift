//
//  APIManger.swift
//  ticketsAPP
//
//  Created by asmaa gamal  on 15/01/2024.
//

import Foundation
class APIManger{
    static let shared = APIManger()
    private init(){
        
    }
    
    func getRequest(url:String , compitation:@escaping(Data?)->Void){
        guard let requestURL = URL(string:url)else{return }
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        request.timeoutInterval = 30.0
        request.setValue("8a47dda633mshc50d0d1f4c16f9fp1cab33jsn7b7ecb0ee4a6", forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("bitcoinaverage-global-ethereum-index-v1.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        request.cachePolicy = .useProtocolCachePolicy
        
        let task = URLSession.shared.dataTask(with:request ){data , response ,error in
            if data != nil {
                compitation(data)
            }else{
                compitation(nil)
            }
            
        }
        task.resume()
        
    }
    
    
    
}
