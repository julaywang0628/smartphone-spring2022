//
//  ViewController.swift
//  SegueExample
//
//  Created by Julay Wang on 2/11/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func GoToSecondVC(_ sender: Any) {
        
        performSegue(withIdentifier: "SegueToSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.welcomeStr = "Welcome \(txtFirstName.text!), \(txtLastName.text!)"
            
        }
    }
    
}

