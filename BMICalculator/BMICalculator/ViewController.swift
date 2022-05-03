//
//  ViewController.swift
//  BMICalculator
//
//  Created by Julay Wang on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtFeet: UITextField!
    @IBOutlet weak var txtInches: UITextField!

    @IBOutlet weak var lblBMI: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateBMIAction(_ sender: Any) {
        guard let weightString = txtWeight.text,
              let feetString = txtFeet.text,
              let inchesString = txtInches.text else {
                return
            }

        guard let heightFeet = Double(feetString),
              let heightInches = Double(inchesString),
              let weight = Double(weightString) else {
                return
            }
        
        let height = heightFeet * 12 + heightInches
        
        let BMI = (weight / pow(height, 2)) * 703
        
        let bmiRounded = (round(BMI * 10) / 10)
        
        if bmiRounded < 18.5 {
            self.lblBMI.text = "Your BMI is: \(bmiRounded). You are underweight."
        } else if bmiRounded >= 18.5 && bmiRounded < 24.9 {
            self.lblBMI.text = "Your BMI is: \(bmiRounded). You are healthy weight."
        } else if bmiRounded >= 25 && bmiRounded < 29.9 {
            self.lblBMI.text = "Your BMI is: \(bmiRounded). You are overweight."
        } else {
            self.lblBMI.text = "Your BMI is: \(bmiRounded). You are obese."
        }
    }
    
}

