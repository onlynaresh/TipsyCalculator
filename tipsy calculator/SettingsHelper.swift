//
//  SettingsHelper.swift
//  tipsy calculator
//
//  Created by Yerneni, Naresh on 3/13/17.
//  Copyright © 2017 Yerneni, Naresh. All rights reserved.
//

import UIKit

class SettingsHelper {
    
    struct SettingsConst {
        static let defaultTipIndexKey = "tipIndex"
        static let lastBillAmountKey = "previousBillamount"
        static let lastBillTimestampKey = "previousBillts"
        
        
        static let billAmountTimeToLive = TimeInterval(1 * 60)
        
        static let defaults = UserDefaults.standard
    }
    
    class func setDefaultTipIndex(tipIndex: Int) {
        SettingsConst.defaults.set(tipIndex, forKey: SettingsConst.defaultTipIndexKey)
        SettingsConst.defaults.synchronize()
    }
    
    class func getDefaultTipIndex() -> Int {
        return SettingsConst.defaults.integer(forKey: SettingsConst.defaultTipIndexKey)
    }
    
    class func setLastBillAmount(billAmount: String) {
        SettingsConst.defaults.set(billAmount, forKey: SettingsConst.lastBillAmountKey)
        SettingsConst.defaults.set(NSDate(), forKey: SettingsConst.lastBillTimestampKey)
        
        SettingsConst.defaults.synchronize()
    }
    
   
    class func getLastBillAmount() -> String? {
        let now = NSDate()
        let lastBillTimestamp = SettingsConst.defaults.object(forKey: SettingsConst.lastBillTimestampKey) as! NSDate?
        
        let isBillAmountExpired = lastBillTimestamp == nil || now.timeIntervalSince(lastBillTimestamp! as Date) > SettingsConst.billAmountTimeToLive
        
        if isBillAmountExpired {
            return nil
        } else {
            return SettingsConst.defaults.object(forKey: SettingsConst.lastBillAmountKey) as! String?
        }
    }
}
