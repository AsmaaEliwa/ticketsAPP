//
//  DataModel.swift
//  ticketsAPP
//
//  Created by asmaa gamal  on 15/01/2024.
//
import Foundation

struct CurrencyPair: Codable {
    var ask: Double?
    var bid: Double?
    var last: Double?
    var high: Double?
    var low: Double?
    var volume: Double?
    var averages: AveragesData
    var timestamp: Int?
    var displayTimestamp: String?
    var displaySymbol: String?
}

struct AveragesData: Codable {
    var day: Double?
    var week: Double?
    var month: Double?
}


struct PercentData: Codable {
    var day: Double?
    var week: Double?
    var month: Double?
    var year: Double?
}

struct AllTicketDataModel: Codable {
    var currencyPairs: [String: CurrencyPair?]
}


