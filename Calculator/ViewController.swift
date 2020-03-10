//
//  ViewController.swift
//  Calculator
//
//  Created by Mehdi Ghannadan on 3/9/20.
//  Copyright © 2020 Mehdi Ghannadan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - View Did Load

    override func viewDidLoad() {
        super.viewDidLoad()
        DoneButtonOnKeyboard()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Outlets
    
    @IBOutlet weak var subtotalTextfield: UITextField!
    @IBOutlet weak var tiptotalTextfield: UITextField!
    @IBOutlet weak var tippercentTextfield: UITextField!
    @IBOutlet weak var totalTextfield: UITextField!
    

    //MARK: - Functions
    
    func DoneButtonOnKeyboard() {
        subtotalTextfield.becomeFirstResponder()
        
        let accessoryToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        accessoryToolbar.barStyle = UIBarStyle.default
        
        let resetButton = UIBarButtonItem.init(title: "Reset", style: .done, target: self, action: nil)
        let doneButton = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(self.subtotalTextfield.resignFirstResponder))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        
        let itemsInToolbar = [resetButton, flexSpace, doneButton]
        accessoryToolbar.items = itemsInToolbar
        accessoryToolbar.sizeToFit()
        
        subtotalTextfield.inputAccessoryView = accessoryToolbar
        
        
    }
    
    
}

