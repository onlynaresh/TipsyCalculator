//
//  SettingsViewController.swift
//  tipsy calculator
//
//  Created by Yerneni, Naresh on 3/13/17.
//  Copyright © 2017 Yerneni, Naresh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipC: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipC.selectedSegmentIndex = SettingsHelper.getDefaultTipIndex()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func defaultTipCValChange(_ sender: Any) {
            SettingsHelper.setDefaultTipIndex(tipIndex: defaultTipC.selectedSegmentIndex)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        view.backgroundColor = UIColor.gray
    }
}
