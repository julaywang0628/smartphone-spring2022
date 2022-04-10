//
//  QuoteShortModel.swift
//  StockPrice
//
//  Created by Julay Wang on 4/10/22.
//

import Foundation

class StockQuoteModel {
    init(_ symbol: String, _ name: String) {
        self.symbol = symbol
        self.name = name
    }
    var symbol : String = ""
    var name : String = ""
    var price : Float = 0.0
    var dayHigh : Float = 0.0
    var dayLow : Float = 0.0
}
