//
//  ViewController.swift
//  StockPrice
//
//  Created by Julay Wang on 4/10/22.
//

import UIKit

class ViewController: UIViewController, SendQuoteDelegate {
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblDayHigh: UILabel!
    
    @IBOutlet weak var lblDayLow: UILabel!
    var companiesModel: [StockQuoteModel]?

    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getAAPLPrice()
        companiesModel = initializeCompanies()
    }

    
    func getAAPLPrice(){
        let url = "https://financialmodelingprep.com/api/v3/quote/AAPL?apikey=872fb53171b4d61b8aae392737439d0d"
        
        getStockQuote(url)
            .done { stockQuote in
                self.lblName.text = stockQuote.name
                self.lblSymbol.text = stockQuote.symbol
                self.lblPrice.text = "Price: \(stockQuote.price) $"
                self.lblDayHigh.text = "Day High: \(stockQuote.dayHigh) $"
                self.lblDayLow.text = "Day Low: \(stockQuote.dayLow) $"
            }
            .catch { error in
                print(error.localizedDescription)
            }
    }
    
    func initializeCompanies() -> [StockQuoteModel] {
        let FB = StockQuoteModel("FB");
        let AAPL = StockQuoteModel("AAPL");
        let GOOG = StockQuoteModel("GOOG");
        let MSFT = StockQuoteModel("MSFT");
        let AMZN = StockQuoteModel("AMZN");
        
        var modelArr = [StockQuoteModel]()
        
        modelArr.append(FB)
        modelArr.append(AAPL)
        modelArr.append(GOOG)
        modelArr.append(MSFT)
        modelArr.append(AMZN)
        
        return modelArr
    }
    
    func sendQuoteData(_ stockQuoteModel: StockQuoteModel) {
        lblName.text = stockQuoteModel.name
        lblSymbol.text = stockQuoteModel.symbol
        lblPrice.text = "Price: \(stockQuoteModel.price) $"
        lblDayHigh.text = "Day High: \(stockQuoteModel.dayHigh) $"
        lblDayLow.text = "Day Low: \(stockQuoteModel.dayLow) $"
    }
}

