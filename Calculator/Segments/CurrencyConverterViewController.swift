//
//  CurrencyConverterViewController.swift
//  Calculator
//
//  Created by Konstantinos Kolioulis on 26/9/20.
//  Copyright © 2020 Konstantinos Kolioulis. All rights reserved.
//

import UIKit
import Alamofire

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
        getRates()
    }
    
    private func getRates() {
        let url = "http://data.fixer.io/api/latest"
        let parameters = ["access_key": "cf2cec699bac6a877687217edc984666"]
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            guard let data = response.data else { return }
            do {
                let ratesResponse = try JSONDecoder().decode(ApiGetRatesResponse.self, from: data)
//                let r = ratesResponse.rates?.AED ?? 0.0
            } catch {
                print(error)
            }
        }
    }
}

extension CurrencyConverterViewController: SpinnerViewDelegate {
    func didTapOnView() {
        
    }
}
