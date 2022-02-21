//
//  GetNameViewController.swift
//  ProtocolDelegate
//
//  Created by Julay Wang on 2/13/22.
//

import UIKit

protocol SendFirstAndLastNameDelegate {
    func setFirstNameAndLastName(firstName : String, lastName : String)
    func setWelcomeText(welcomeText : String?)
}

class GetNameViewController: UIViewController {
    
    var firstName : String?
    var lastName : String?
    
    var sendFirstAndLastNameDelegate : SendFirstAndLastNameDelegate?
    var sendMessageDelegate: SendMessageDelegate?
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let firstName = firstName else {
            return
        }
        
        guard let lastName = lastName else {
            return
        }
        
        txtFirstName.text = firstName
        txtLastName.text = lastName

    }
    
    @IBAction func saveName(_ sender: Any) {
        
        guard let first = txtFirstName.text else {return}
        guard let last = txtLastName.text else {return}
        
        
        sendMessageDelegate?.sendMessage(message : "Welcome! \(first) \(last)")
        
       self.navigationController?.popViewController(animated: true)
    }
    

}
