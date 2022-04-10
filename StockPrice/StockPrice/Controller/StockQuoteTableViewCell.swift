//
//  StockQuoteTableViewCell.swift
//  StockPrice
//
//  Created by Julay Wang on 4/10/22.
//

import UIKit

class StockQuoteTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    var name = ""
    var symbol = ""
    var sendQuoteDelegate : SendQuoteDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func getPriceAction(_ sender: Any) {
    
        let currentURL = getStockQuoteURL(symbol)
        
        getStockQuote(currentURL)
            .done{ stockQuoteModel in
                stockQuoteModel.symbol = self.symbol
                self.sendQuoteDelegate?.sendQuoteData(stockQuoteModel)
            }
            .catch{ error in
                print(error.localizedDescription)
            }
    }
    
}
