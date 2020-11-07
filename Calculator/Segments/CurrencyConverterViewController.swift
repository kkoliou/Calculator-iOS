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
    
    private var rates = [String?: Double?]()
    private var filteredRates = [String: Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        getRates()
    }
    
    private func getRates() {
        let url = "http://data.fixer.io/api/latest"
        let parameters = ["access_key": "cf2cec699bac6a877687217edc984666"]
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            guard let data = response.data else { return }
            do {
                let ratesResponse = try JSONDecoder().decode(ApiGetRatesResponse.self, from: data)
                guard let rates = ratesResponse.rates else { return }
                let mirror = Mirror(reflecting: rates)
                for child in mirror.children  {
                    self.rates[child.label] = child.value as? Double
                }
                self.filterNilRatesValues()
            } catch {
                print(error)
            }
        }
    }
    
    private func filterNilRatesValues() {
        for (key, value) in self.rates {
            guard let key = key else { return }
            guard let value = value else { return }
            self.filteredRates[key] = value
        }
        self.breakIntoArrays()
    }
    
    private func breakIntoArrays() {
        var ratesKeys = [String]()
        var ratesValues = [Double]()
        
        for (key, value) in self.filteredRates {
            ratesKeys.append(key)
            ratesValues.append(value)
        }
        
        self.updateSpinners(keys: ratesKeys, values: ratesValues)
    }
    
    private func updateSpinners(keys: [String], values: [Double]) {
        let sorted = zip(keys, values).sorted { $0.0 < $1.0 }
        let sortedValues = sorted.map { $0.1 }
        let sortedKeys = sorted.map { $0.0 }
        
        self.fromSpinnerView.update(ratesKeys: sortedKeys, ratesValues: sortedValues)
        self.toSpinnerView.update(ratesKeys: sortedKeys, ratesValues: sortedValues)
    }
}
