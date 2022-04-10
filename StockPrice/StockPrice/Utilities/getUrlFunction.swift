//
//  getUrlFunctions.swift
//  StockPrice
//
//  Created by Julay Wang on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

func getStockQuoteURL(_ symbol : String) -> String{
    let url = "\(quoteAPIUrl)\(symbol.uppercased())?apikey=\(apiKey)"
    return url
}

func getStockQuote(_ url : String) -> Promise<StockQuoteModel>{
        return Promise<StockQuoteModel> { seal -> Void in
            AF.request(url).responseJSON { response in
            if response.error != nil {
                seal.reject(response.error!)
            }
                
            let quote = StockQuoteModel("","")
            let stockArray = JSON(response.data!).arrayValue
            
            guard let stock = stockArray.first else { return seal.fulfill(quote)}
            quote.name = stock["name"].stringValue
            quote.symbol = stock["symbol"].stringValue
            quote.price = stock["price"].floatValue
            quote.dayHigh = stock["dayHigh"].floatValue
            quote.dayLow = stock["dayLow"].floatValue


            seal.fulfill(quote) // fulfilling the promise

            }// end of response
    }// end is return Promise
}
