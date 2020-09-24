//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Haruna Yamakawa on 9/13/20.
//  Copyright © 2020 Haruna. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    @IBOutlet weak var defaultLabel: UILabel!
    @IBOutlet weak var darkLabel: UILabel!
    @IBOutlet weak var outletSwitch: UISwitch!
    
    @IBOutlet weak var defaultSetting: UISegmentedControl!
    
    var firstTimeAppLaunch: Bool {
        get {
            // Will return false when the key is not set.
            return defaults.bool(forKey: "firstTimeAppLaunch")
        }
        set {}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        // to load a key from UserDefaults
        if !firstTimeAppLaunch {
            // This will only be trigger first time the application is launched.
            defaults.set(true, forKey: "firstTimeAppLaunch")
            defaults.set(true, forKey: "mySwitchValue")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        outletSwitch.isOn = defaults.bool(forKey: "mySwitchValue")
        switchToDark(UISwitch.self)
    }
    
    @IBAction func setDefaultValue(_ sender: Any) {
        defaults.set(defaultSetting.selectedSegmentIndex, forKey: "defaultTipAmount")
        defaults.synchronize()
        print("default value selected")
    }
    
  
    @IBAction func saveSwitchState(_ sender: UISwitch) {
        defaults.set(sender.isOn, forKey: "mySwitchValue")
    }
    
    @IBAction func switchToDark(_ sender: Any) {
        if outletSwitch.isOn == true {
            view.backgroundColor = UIColor.black
            defaultLabel.textColor = UIColor.white
            darkLabel.textColor = UIColor.white
            //9.24 set default bg color
        
            let darkModeSwitch = "darkModeSwitch"
            defaults.set(true, forKey: darkModeSwitch)
            defaults.synchronize()
            print("switch to dark mode")
            
        } else {
            defaults.set(false,forKey: "darkModeSwitch" )
            defaults.synchronize()
            view.backgroundColor = UIColor.white
            defaultLabel.textColor = UIColor.black
            darkLabel.textColor = UIColor.black
            print("light mode")
        }
    }
    
}
