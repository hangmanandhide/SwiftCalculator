//
//  ViewController.swift
//  Calculator
//
//  Created by Mehdi Ghannadan on 3/9/20.
//  Copyright © 2020 Mehdi Ghannadan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - View Did Load

    override func viewDidLoad() {
        super.viewDidLoad()
        subtotalTextfield.becomeFirstResponder()
        createKeyboard()
        tipPercentSlider.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Outlets
    
    @IBOutlet weak var subtotalTextfield: UITextField!
    @IBOutlet weak var tiptotalTextfield: UITextField!
    @IBOutlet weak var tippercentTextfield: UITextField!
    @IBOutlet weak var totalTextfield: UITextField!
    @IBOutlet weak var tipPercentSlider: UISlider!
    
    //MARK: - Properties
    let model = Model()
    
    //MARK: - Interactions
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tipPercentSlider.isEnabled = false
    }
    
    @IBAction func dragSlider(_ sender: UISlider) {
        tippercentTextfield.text = "Tip (\(Int(sender.value))%):"
        print("\(Int(sender.value))")
        
        model.tipPercentFromSlider = Int(sender.value)
        updateLabels()
    }
    

    //MARK: - Functions
    
    func createKeyboard() {
        
        let accessoryToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        accessoryToolbar.barStyle = UIBarStyle.default
        
        let resetButton = UIBarButtonItem.init(title: "Reset", style: .done, target: self, action: #selector(resetValues))
        let doneButton = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(checkForChange))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        
        let itemsInToolbar = [resetButton, flexSpace, doneButton]
        accessoryToolbar.items = itemsInToolbar
        accessoryToolbar.sizeToFit()
        
        subtotalTextfield.inputAccessoryView = accessoryToolbar
        
        
    }
    
    @objc func checkForChange() {
        if (subtotalTextfield.text == model.changeCheckValue) || subtotalTextfield.text?.count == 0 {
            return
        } else {
            runCalculations()
        }
    }
    
    @objc func runCalculations() {
        tipPercentSlider.isEnabled = true
        
        if subtotalTextfield.text?.count == 0 {
            subtotalTextfield.text = "$0.00"
            model.subTotalFromTextField = "$0.00"
            updateLabels()
        } else {
            model.tipPercentFromSlider = Int(tipPercentSlider.value)
            model.subTotalFromTextField = subtotalTextfield.text!
            
            updateLabels()
        }
    }
    
    func updateLabels() {
        subtotalTextfield.text = model.subTotaltoCurrency
        tiptotalTextfield.text = model.tipAmounttoCurrency
        totalTextfield.text = model.totalAmounttoCurrency
        model.changeCheckValue = model.subTotaltoCurrency
    }
    
    @objc func resetValues() {
        subtotalTextfield.text?.removeAll()
        model.tipPercentFromSlider = 15
        model.subTotalFromTextField = "$0.00"
        tiptotalTextfield.text = "$0.00"
        totalTextfield.text = "$0.00"
        tipPercentSlider.isEnabled = false
    }
    
    
    
}

