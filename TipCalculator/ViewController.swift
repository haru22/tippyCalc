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

    @IBOutlet weak var tipLabel2: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountLabel: UILabel!
    
    @IBOutlet weak var tipAmount: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billField.becomeFirstResponder()
        // show keyboard permanently
        
        // slide bar animation
//        animator.addAnimations {
//            self.view.backgroundColor = .cyan
//        }
//        let slider = UISlider()
//        slider.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(slider)
//        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        slider.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100).isActive = true
//        slider.widthAnchor.constraint(equalToConstant: view.frame.width-150).isActive = true
//
//        slider.addTarget(self, action: #selector(self.handleSliderChanged(slide:)), for: .allEvents)
//
//        let viewToAnimate = UIView()
//
//
//        UIView.animate(withDuration: 1) {
//            viewToAnimate.alpha = 0
//        }
    }
    
    // slide bar background change
//    @objc fileprivate func handleSliderChanged(slide: UISlider) {
//        print(slide.value)
//        animator.fractionComplete = CGFloat(slide.value)
//
//    }

    @IBAction func onTap(_ sender: Any) {
        print("tapped")
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
//        let tip1 = Double(format:"$%.2f",tip)
//        totipLabel1.text = String(format:"$%.2f",tip)
//        totalLabel.text = String(format:"$%.2f",total)
        tipLabel.text = convertDoubleToCurrency(amount: tip)
        totalLabel.text = convertDoubleToCurrency(amount: total)
    }
    


    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        // retrive new default value
        let defaults = UserDefaults.standard

        let defaultValue = defaults.value(forKey: "defaultTipAmount")
        let selectedIndex = defaultValue
        tipAmount.selectedSegmentIndex = selectedIndex as? Int ?? 0
        
        // back ground color switch
        let bgDefault = UserDefaults.standard
        var darkModeSwitchIsOn = false
        darkModeSwitchIsOn = bgDefault.bool(forKey: "darkModeSwitch")
        if darkModeSwitchIsOn {
            self.view.backgroundColor = UIColor.black
            tipLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            billAmountLabel.textColor = UIColor.white
            tipLabel2.textColor = UIColor.white
            print("dark mode view controller")
            
        } else {
            self.view.backgroundColor = .white
            tipLabel.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            billAmountLabel.textColor = UIColor.black
            tipLabel2.textColor = UIColor.black
            print("light mode viewController")
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
        print("view did disappear")
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

