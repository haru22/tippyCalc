//
//  ViewController.swift
//  TipCalculator
//
//  Created by Haruna Yamakawa on 12/17/19.
//  Copyright © 2019 Haruna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipAmount: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        //get the bill amount
        let bill = Double(billField.text!) ?? 0
        //calculate the tip total
        let tipPercentage = [0.15, 0.18, 0.2]
        let tip =  bill * tipPercentage[tipAmount.selectedSegmentIndex]
        let total = bill + tip
        //update the tip and total label
        tipLabel.text = String(format:"$%.2f",tip)
        totalLabel.text = String(format:"$%.2f",total)
    }
}

