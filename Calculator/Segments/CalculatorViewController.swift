//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Konstantinos Kolioulis on 26/9/20.
//  Copyright © 2020 Konstantinos Kolioulis. All rights reserved.
//

import UIKit
import MathExpression

class CalculatorViewController: UIViewController {

    //numpad buttons
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var delButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var divButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var multButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    
    //display view label
    @IBOutlet weak var inputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    init() {
        super.init(nibName: "CalculatorViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        inputLabel.text = "0"
    }
    
    @IBAction func didTapOnClearAll(_ sender: Any) {
        inputLabel.text = "0"
    }
    
    @IBAction func didTapOnDelete(_ sender: Any) {
        guard var input = inputLabel.text else { return }
        
        if input.count > 1 {
            input = String(input.dropLast())
            inputLabel.text = input
        } else {
            inputLabel.text? = "0"
        }
    }
    
    @IBAction func didTapOnPercent(_ sender: Any) {
        guard let str = inputLabel.text else { return }
        
        if str.count == 1 { //if input == "+" etc
            if !str[str.index(str.startIndex, offsetBy: 0)].isNumber {
                inputLabel.text = "0"
                return
            }
        }
        
        if str.contains("+") || str.contains("×") || str.contains("−") || str.contains("÷") {
            return
        }
        
        if str.count > 0 {
            if str != "0" {
                let num = Double(str)! / 100.0
                inputLabel.text = "\(num)"
            }
        }
    }
    
    @IBAction func didTapOnDiv(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnMult(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnSub(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnAdd(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnResult(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnDot(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnZero(_ sender: Any) {
        guard var input = inputLabel.text else { return }
        
        if hasMaxInputCount() {
            return
        }
        
        if input != "0" && input.count >= 1 {
            input += "0"
            inputLabel.text = input
        } else if input.count == 0 {
            inputLabel.text = "0"
        }
    }
    
    @IBAction func didTapOnOne(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        var str = startsWithZero()
        str = hasZeroAfterOp(str)
        inputLabel.text = str + "1"
    }
    
    @IBAction func didTapOnTwo(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        var str = startsWithZero()
        str = hasZeroAfterOp(str)
        inputLabel.text = str + "2"
    }
    
    @IBAction func didTapOnThree(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        var str = startsWithZero()
        str = hasZeroAfterOp(str)
        inputLabel.text = str + "3"
    }
    
    @IBAction func didTapOnFour(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        var str = startsWithZero()
        str = hasZeroAfterOp(str)
        inputLabel.text = str + "4"
    }
    
    @IBAction func didTapOnFive(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        var str = startsWithZero()
        str = hasZeroAfterOp(str)
        inputLabel.text = str + "5"
    }
    
    @IBAction func didTapOnSix(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        var str = startsWithZero()
        str = hasZeroAfterOp(str)
        inputLabel.text = str + "6"
    }
    
    @IBAction func didTapOnSeven(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        var str = startsWithZero()
        str = hasZeroAfterOp(str)
        inputLabel.text = str + "7"
    }
    
    @IBAction func didTapOnEight(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        var str = startsWithZero()
        str = hasZeroAfterOp(str)
        inputLabel.text = str + "8"
    }
    
    @IBAction func didTapOnNine(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        var str = startsWithZero()
        str = hasZeroAfterOp(str)
        inputLabel.text = str + "9"
    }
    
    private func startsWithZero() -> String {  //if input is 0, pressing 1, 0 will be replaced by 1
        guard var input = inputLabel.text else { return "" }
        
        if input.count == 1 {
            if input[input.index(input.startIndex, offsetBy: 0)] == "0" {
                input = ""
            }
        }
        return input
    }
    
    private func hasZeroAfterOp(_ str: String) -> String {  //avoid input like 9/003
        var result = str
        if str.count > 1 {
            let op = str[str.index(str.endIndex, offsetBy: -2)]
            
            if op == "+" || op == "×" || op == "−" || op == "÷" {
                if str[str.index(str.endIndex, offsetBy: -1)] == "0" {
                    let index = str.index(str.endIndex, offsetBy: -1)
                    result = String(str[..<index])
                }
            }
        }
        return result
    }
    
    private func hasMaxInputCount() -> Bool {
        guard let input = inputLabel.text else { return true }
        
        return !(input.count <= 25)
    }
}
