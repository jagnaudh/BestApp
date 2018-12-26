//
//  ViewController.swift
//  Gratuity Calculator
//
//  Created by j.bhatia on 12/26/18.
//  Copyright © 2018 j.bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        amountBeforeTaxLabel.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var totalResultLabel: UILabel!
    @IBOutlet weak var amountBeforeTaxLabel: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var eachPersonAmount: UILabel!
    
    var tipCalculator = TipCalculator(amountBeforeTax: 0, tipPercentage: 0.10)
    
    func calculateTip() {
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value)/100.0
        tipCalculator.amountBeforeTax = (amountBeforeTaxLabel.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        totalResultLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        let numberOfPeople: Int = Int(numberOfPeopleSlider.value)
        eachPersonAmount.text = String(format:"$%0.2f", tipCalculator.totalAmount/Double(numberOfPeople))
        
    }
    
    @IBAction func tipSliderValueChanged(_ sender: Any) {
        tipPercentageLabel.text = String(format: "Tip: %02d%%", Int(tipPercentageSlider.value))
        calculateTip()
    }
    
    @IBAction func numberOfPeopleSliderValueChanged(_ sender: Any) {
        numberOfPeopleLabel.text = "Split: \(Int(numberOfPeopleSlider.value))"
        calculateTip()
    }
   
    @IBAction func amountBeforeTaxTextfieldChange(_ sender: Any) {
        calculateTip()
    }
    
    
}

