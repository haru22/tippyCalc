//
//  ViewController.swift
//  TipCalculator
//
//  Created by Haruna Yamakawa on 12/17/19.
//  Copyright © 2019 Haruna. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    // slide bar
    let animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: nil)
    var total = 0.0;
    @IBOutlet weak var tipLabel2: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var splittedValueLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var splitField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billField.becomeFirstResponder()
        overrideUserInterfaceStyle = .light
        
 
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        //get the bill amount
        let bill = Double(billField.text!) ?? 0
        //calculate the tip total
        
        /* when you use segmented control to get tip amount
        let tipPercentage = [0.15, 0.18, 0.2]
        let tip =  bill * tipPercentage[tipAmount.selectedSegmentIndex]
        */
        
        /*use slide bar to get tip amount*/
        let tip = bill * Double(tipPercentageSlider.value / 100.0)
        total = bill + tip
        //update the tip and total label
        
        
//        let tip1 = Double(format:"$%.2f",tip)
//        totipLabel1.text = String(format:"$%.2f",tip)
//        totalLabel.text = String(format:"$%.2f",total)
        
        // apply current currency setting
        tipLabel.text = convertDoubleToCurrency(amount: tip)
        totalLabel.text = convertDoubleToCurrency(amount: total)
    }
    


    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // retrive new default value
        let defaults = UserDefaults.standard

        let defaultValue = defaults.value(forKey: "defaultTipAmount")
        let selectedTipPercentage = defaultValue
//        let selectedIndex = defaultValue
//        tipAmount.selectedSegmentIndex = selectedIndex as? Int ?? 0
        tipPercentageSlider.value = selectedTipPercentage as! Float
        percentageLabel.text = String(format: "%.2f%%", Double(tipPercentageSlider.value))
        
        // back ground color switch
        let bgDefault = UserDefaults.standard
        var darkModeSwitchIsOn = false
        darkModeSwitchIsOn = bgDefault.bool(forKey: "darkModeSwitch")
        if darkModeSwitchIsOn {
             overrideUserInterfaceStyle = .dark
            
        } else {
             overrideUserInterfaceStyle = .light
        }
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func convertCurrencyToDouble(input: String) -> Double {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        return numberFormatter.number(from: input)!.doubleValue
    }
    
    func convertDoubleToCurrency(amount: Double) -> String {
          
          let numberFormatter = NumberFormatter()
          numberFormatter.numberStyle = .currency
          numberFormatter.locale = Locale.current
          
          
        return numberFormatter.string(from: NSNumber(value: amount))!
          
      }
      
    @IBAction func SliderAction(_ sender: Any) {
        percentageLabel.text = String(format: "%.2f%%", Double(tipPercentageSlider.value))
        calculateTip((Any).self)
    }
    
    @IBAction func splitBill(_ sender: Any) {
        //        let total = Double(totalLabel.text!) ?? 0
        print("This is total" ,total)
        let numOfPeople = Double(splitField.text!) ?? 0
        print("This is num of people" ,numOfPeople)
        let splittedValue = total / numOfPeople
        print(splittedValue)
        splittedValueLabel.text = String(format:"$%.2f",splittedValue)
    }

    // Defaults = DIctionary[:]
    
//
//    func userInput(num: Int) -> {
//        let defaults = UserDefaults.standard
//        let lastInput = 35
//        // save this date
//        let lastInputDate = Date()
//        defaults.set(lastInputDate, foreKey: "previousInputDate")
//        defaults.set(lastInput, forKey:"previousInput")
//        // when you log back in to your app
//        sleep(5) // second
//        let timeSinceLastInput = Date().timeIntervalSince(lastInputDate)
//
//        if (timeSinceLastInput > 600) {
//            //reset user input
//            return
//        }
//        // access userdefault value
//           defaults.object(forKey: "previousInputDate") as! Date
//           defaults.float(forKey: "previousInput") as! Float
//
//        return
//    }
//
   // inputOUtlet.text = defaults.float(forkey: as!)
}

