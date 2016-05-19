//
//  CalculatorViewController.swift
//  StanfordCalc
//
//  Created by Micaela Neus on 4/26/16.
//  Copyright © 2016 Micaela Neus. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    private var calc = Calculator()

    @IBOutlet private weak var display: UILabel!

    var displayValue : Double {
        get {
            return Double(display.text!)!
        }
        set {
            return display.text = String(newValue)
        }
    }

    private var userTyping = false

    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userTyping {
            let currentDisplayText = display.text!
            display.text = currentDisplayText + digit
        } else {
            display.text = digit
        }
        userTyping = true
    }

    @IBAction private func performOperation(sender: UIButton) {
        if userTyping {
            calc.setOperand(displayValue)
            userTyping = false
        }
        if let symbol = sender.currentTitle {
            calc.performOperation(symbol)
        }
        displayValue = calc.result
    }
}

