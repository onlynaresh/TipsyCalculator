//
//  Color.swift
//  tipsy calculator
//
//  Created by Yerneni, Naresh on 3/13/17.
//  Copyright © 2017 Yerneni, Naresh. All rights reserved.
//

class color
{
    class func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
