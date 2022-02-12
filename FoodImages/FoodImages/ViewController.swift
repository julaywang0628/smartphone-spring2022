//
//  ViewController.swift
//  FoodImages
//
//  Created by Julay Wang on 2/3/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let images = ["Food1", "Food2", "Food3", "Food4", "Food5", "Food6", "Food7"]
    
    let imageNames = ["Dim Sum", "Dongpo Pork", "Dumpling", "Fried Rice", "Hot Pot", "Sour Soup", "Vegetable"]
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!TableViewCell
        cell.imgViewCell.image = UIImage(named: images[indexPath.row])
        cell.lblCell.text = imageNames[indexPath.row]
    
        return cell
    }


}

