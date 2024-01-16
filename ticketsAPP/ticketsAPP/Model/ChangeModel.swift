//
//  ChangeModel.swift
//  ticketsAPP
//
//  Created by asmaa gamal  on 15/01/2024.
//

import Foundation
struct ChangeModel:Codable{
    var ask: Double
      var bid: Double
      var last: Double
      var high: Double
      var low: Double
      var open: OpenData
      var averages: AveragesModel
      var volume: Double
      var changes: ChangesData
      var volumePercent: Double
      var timestamp: Int
      var displayTimestamp: String
      var displaySymbol: String
}

struct OpenData: Codable {
    var hour: Double
    var day: Double
    var week: Double
    var month: Double
    var month3: Double
    var month6: Double
    var year: Double
}

struct AveragesModel: Codable {
    var day: Double
    var week: Double
    var month: Double
}

struct PriceData: Codable {
    var hour: Double
    var day: Double
    var week: Double
    var month: Double
    var month3: Double
    var month6: Double
    var year: Double
}

struct ChangesData: Codable {
    var price: PriceData
    var percent: PriceData
}
