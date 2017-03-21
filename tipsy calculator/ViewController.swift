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
        totalValue.alpha = 0
        tipValue.alpha=0
    
    
   }
    
    func formatCurrency(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2;
        formatter.locale = Locale(identifier: Locale.current.identifier)
        let result = formatter.string(from: value as NSNumber);
        return result!;
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.billValue.alpha=1
                   }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
          self.tipValue.alpha=1
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.9, options: .curveEaseOut, animations: {
            self.totalValue.alpha = 1
            let bounds = self.tipControl.bounds
            let screenBounds = UIScreen.main.bounds
            let screenWidth = screenBounds.size.width
            if(screenWidth > bounds.size.width){
            self.tipControl.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 25, height: bounds.size.height)
            }
     
        }, completion: nil)
        
         view.backgroundColor = UIColor.lightGray
        
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
        
        tipValue.text = formatCurrency(value: tip)
        totalValue.text=formatCurrency(value: total)
        
       // tipValue.text=String(format:"$%.2f",tip)
        
        // totalValue.text=String(format:"$%.2f",total)
        
        view.backgroundColor = UIColor.green
        
    }

    
 
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
}

