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

    @IBAction func performOperation(sender: UIButton) {
        userTyping = false
        if let symbol = sender.currentTitle {
            if symbol == "π" {
                display.text = String(M_PI)
            }
        }
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

