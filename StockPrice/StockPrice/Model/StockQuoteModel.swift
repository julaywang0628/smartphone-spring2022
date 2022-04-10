//
//  QuoteShortModel.swift
//  StockPrice
//
//  Created by Julay Wang on 4/10/22.
//

import Foundation

class StockQuoteModel {
    init(_ symbol: String) {
        self.symbol = symbol
    }
    var symbol : String = ""
    var name : String = ""
    var price : Float = 0.0
    var dayHigh : Float = 0.0
    var dayLow : Float = 0.0
}
