//
//  CurrencyConverterViewController.swift
//  Calculator
//
//  Created by Konstantinos Kolioulis on 26/9/20.
//  Copyright © 2020 Konstantinos Kolioulis. All rights reserved.
//

import UIKit

class CurrencyConverterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
    }
    
    init() {
        super.init(nibName: "CurrencyConverterViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
