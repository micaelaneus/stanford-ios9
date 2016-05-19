//
//  CalculatorViewController.swift
//  StanfordCalc
//
//  Created by Micaela Neus on 4/26/16.
//  Copyright © 2016 Micaela Neus. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {


    @IBOutlet weak var display: UILabel!

    private var userTyping = false

    var displayValue : Double {
        get {
            return Double(display.text!)!
        }
        set {
            return display.text = String(newValue)
        }
    }

    @IBAction func performOperation(sender: UIButton) {
        userTyping = false
        if let symbol = sender.currentTitle {
            if symbol == "π" {
                displayValue = M_PI
            }
        } else if let symbol = sender.currentTitle {
            if symbol == "q" {
                displayValue = sqrt(displayValue)
            }
        } else {}
    }

    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userTyping {
            let currentDisplayText = display.text!
            display.text = currentDisplayText + digit
        } else {
            display.text = digit
        }
        userTyping = true
    }
}

