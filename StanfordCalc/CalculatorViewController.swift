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

    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        let currentDisplayText = display.text!
        display.text = currentDisplayText + digit
    }
}

