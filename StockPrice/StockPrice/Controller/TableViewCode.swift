//
//  TableViewCode.swift
//  StockPrice
//
//  Created by Julay Wang on 4/10/22.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = companiesModel?.count else { return 0 }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        cell.textLabel?.text = companies[indexPath.row]
        
        let cell = Bundle.main.loadNibNamed("StockQuoteTableViewCell", owner: self, options: nil)?.first as! StockQuoteTableViewCell
                
        guard let companyModel = companiesModel?[indexPath.row] else {return cell}
        cell.lblName.text = companyModel.name
        cell.lblSymbol.text = companyModel.symbol
        cell.symbol = companyModel.symbol
        cell.sendQuoteDelegate = self
        
        return cell
    }
}
