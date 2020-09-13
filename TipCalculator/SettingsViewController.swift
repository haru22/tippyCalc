//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Haruna Yamakawa on 9/13/20.
//  Copyright © 2020 Haruna. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var defaultSetting: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        // to load a key from UserDefaults
        
       
    }
    
    @IBAction func setDefaultValue(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultSetting.selectedSegmentIndex, forKey: "defaultTipAmount")
        defaults.synchronize()
        print("default value selected")
    }
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
