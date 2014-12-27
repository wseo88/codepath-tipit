//
//  AppHelpers.swift
//  tipit
//
//  Created by William Seo on 12/25/14.
//  Copyright (c) 2014 willseo. All rights reserved.
//

import Foundation

func setDefaultTipPercentage(tipPercentage: Double) {
    var defaults = NSUserDefaults.standardUserDefaults()
    defaults.setDouble(tipPercentage, forKey: "default_tip_percentage")
    defaults.synchronize()
}

func getDefaultTipPercentage() -> Double {
    var defaults = NSUserDefaults.standardUserDefaults()
    var defaultTipPercentage = defaults.doubleForKey("default_tip_percentage")
    return defaultTipPercentage
}
