//
//  File.swift
//  Gratuity Calculator
//
//  Created by j.bhatia on 12/26/18.
//  Copyright © 2018 j.bhatia. All rights reserved.
//

import Foundation
class TipCalculator {
    var amountBeforeTax: Double = 0
    var tipAmount: Double = 0
    var tipPercentage: Double = 0
    var totalAmount: Double = 0
    
    init(amountBeforeTax: Double, tipPercentage: Double) {
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
    }
    func calculateTip() {
        tipAmount = amountBeforeTax * tipPercentage
        totalAmount = tipAmount + amountBeforeTax
    }
}
