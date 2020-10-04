//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Konstantinos Kolioulis on 26/9/20.
//  Copyright © 2020 Konstantinos Kolioulis. All rights reserved.
//

import UIKit

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
    @IBOutlet weak var displayLabel: UILabel!
    
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
        displayLabel.text = "545445"
        
    }
    
    @IBAction func didTapOnClearAll(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnDelete(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnPercent(_ sender: Any) {
        
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
        
    }
    
    @IBAction func didTapOnOne(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnTwo(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnThree(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnFour(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnFive(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnSix(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnSeven(_ sender: Any) {
    }
    
    
    @IBAction func didTapOnEight(_ sender: Any) {
        
    }
    
    @IBAction func didTapOnNine(_ sender: Any) {
        
    }
}
