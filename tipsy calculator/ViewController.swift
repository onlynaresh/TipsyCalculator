//
//  ViewController.swift
//  tipsy calculator
//
//  Created by Yerneni, Naresh on 3/2/17.
//  Copyright © 2017 Yerneni, Naresh. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var tipValue: UILabel!
    @IBOutlet weak var totalValue: UILabel!

    @IBOutlet weak var tipControl: UISegmentedControl!
   
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var billValue: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                if let lastBillAmount = SettingsHelper.getLastBillAmount() {
            billValue.text = lastBillAmount
        }
       
    }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
    
     view.backgroundColor = UIColor.lightGray
    
       tipControl.selectedSegmentIndex = SettingsHelper.getDefaultTipIndex()
        billChange(tipControl)
     billValue.becomeFirstResponder()
    
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func segmentedControlChange(_ sender: Any) {
        billChange(tipControl)
    }
 

    @IBAction func billChange(_ sender: AnyObject) {
        
        let billAmountString = billValue.text! as String
        SettingsHelper.setLastBillAmount(billAmount: billAmountString)
        
        let tipPercentages = [0.18, 0.20, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = Double(billAmountString) ?? 0
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipValue.text=String(format:"$%.2f",tip)
        
        totalValue.text=String(format:"$%.2f",total)
        
    }

    
 
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
}

