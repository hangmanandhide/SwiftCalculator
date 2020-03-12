//
//  Model.swift
//  Calculator
//
//  Created by Mehdi Ghannadan on 3/9/20.
//  Copyright © 2020 Mehdi Ghannadan. All rights reserved.
//

import Foundation

class Model {
    
//    Basic Logic:
//    1. take input
//    2. return as strings for labels
//    3. return as strings for labels
//
//    Logic
//    accept subtotal as string
//    accept tipPercent as Int
//
//    convert subtotal to NSDecimal for calculation
//    convert tipPercent to NSDecimal for calculation
//
//    calculate tipAmount
//    calculate totalAmount
//
//    convert subtotal to currency
//    convert tipamount to currency
//    convert total to currency
    
    //MARK: - Calculations
    
    var subTotalFromTextField = "0.00"
    var tipPercentFromSlider = 15
    var changeCheckValue:String = "nil"
    
    
    
    var subtotalAsDecimal: NSDecimalNumber {
        return NSDecimalNumber(string: subTotalFromTextField)
    }
    
    var tipPercent: NSDecimalNumber {
        return NSDecimalNumber(value: Double(tipPercentFromSlider)/100)
    }
    
    var tipAmount: NSDecimalNumber {
        return subtotalAsDecimal.multiplying(by: tipPercent)
    }
    
    var totalAmount: NSDecimalNumber {
        return subtotalAsDecimal.adding(tipAmount)
    }
    
    
    //MARK: - Convert to Currency
    
    let formatter = NumberFormatter()
    
    var subTotaltoCurrency: String {
        formatter.numberStyle = .currency
        return formatter.string(from: subtotalAsDecimal as NSNumber)!
    }

    var tipAmounttoCurrency: String {
        formatter.numberStyle = .currency
        return formatter.string(from: tipAmount as NSNumber)!
    }
    
    var totalAmounttoCurrency: String {
        formatter.numberStyle = .currency
        return formatter.string(from: totalAmount as NSNumber)!
    }
    
    
    
}
