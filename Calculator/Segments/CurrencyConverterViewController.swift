//
//  CurrencyConverterViewController.swift
//  Calculator
//
//  Created by Konstantinos Kolioulis on 26/9/20.
//  Copyright © 2020 Konstantinos Kolioulis. All rights reserved.
//

import UIKit

final class CurrencyConverterViewController: UIViewController {

    @IBOutlet private weak var fromSpinnerView: SpinnerView!
    @IBOutlet private weak var toSpinnerView: SpinnerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        fromSpinnerView.delegate = self
        toSpinnerView.delegate = self
    }
}

extension CurrencyConverterViewController: SpinnerViewDelegate {
    func didTapOnView() {
        
    }
}
