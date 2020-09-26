//
//  ViewController.swift
//  Calculator
//
//  Created by Konstantinos Kolioulis on 16/8/20.
//  Copyright © 2020 Konstantinos Kolioulis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didChangeSegmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            //calculator
        } else {
            //currency converter
        }
    }

}

