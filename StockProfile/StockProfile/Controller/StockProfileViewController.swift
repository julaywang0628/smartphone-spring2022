//
//  StockProfileViewController.swift
//  StockProfile
//
//  Created by Julay Wang on 2/27/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockProfileViewController: UIViewController {

    
    @IBOutlet weak var txtSymbol: UITextField!
    
    @IBOutlet weak var lblProfile: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getStockProfile(_ sender: Any) {
        guard let symbol = txtSymbol.text else { return }
        
        let url = "\(profileURL)\(symbol.uppercased())?apikey=\(apiKey)"
        
//        print(url)
        
        SwiftSpinner.show("Getting Stock Profile for \(symbol)")
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error!)
                return
            }
            
            let profiles = JSON(response.data!).array
            
            guard let profile = profiles!.first else { return }
//            print(profile)
            
            let stockProfile = StockProfile()
            stockProfile.companyName = profile["companyName"].stringValue
            stockProfile.price = profile["price"].floatValue
            stockProfile.currency = profile["currency"].stringValue
            
            self.lblProfile.text = "\(stockProfile.companyName) : \(stockProfile.price) \(stockProfile.currency)"
        }
    }
    

}
