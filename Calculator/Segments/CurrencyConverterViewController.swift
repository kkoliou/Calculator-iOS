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
    @IBOutlet private weak var fromTextField: UITextField!
    @IBOutlet private weak var toTextField: UITextField!
    private var baseCur: (currency: String?, rate: Double?)
    private var convCur: (currency: String?, rate: Double?)
    
    private var rates = [String?: Double?]()
    private var currencies: [(currency: String, rate: Double)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        fromSpinnerView.delegate = self
        toSpinnerView.delegate = self
        fromTextField.text = "0"
        toTextField.text = "0"
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
                self.updateSpinners()
            } catch {
                print(error)
            }
        }
    }
    
    private func updateSpinners() {
        for (key, value) in self.rates {
            guard let key = key else { return }
            guard let value = value else { return }
            self.currencies.append((key, value))
        }
        self.currencies = self.currencies.sorted { $0.0 < $1.0 }
        self.fromSpinnerView.update(with: currencies, type: .from)
        self.toSpinnerView.update(with: currencies, type: .to)
    }
    
    // MARK: - Button Actions
    
    @IBAction private func didTapOnClearAll(_ sender: Any) {
        fromTextField.text = "0"
        toTextField.text = "0"
    }
    
    @IBAction private func didTapOnDelete(_ sender: Any) {
        guard var input = fromTextField.text else { return }
        
        if input.count > 1 {
            input = String(input.dropLast())
            fromTextField.text = input
        } else {
            fromTextField.text = "0"
        }
        updateConvesion()
    }
    
    @IBAction private func didTapOnDot(_ sender: Any) {
        guard var input = fromTextField.text else { return }
        
        if !input[input.index(input.endIndex, offsetBy: -1)].isNumber {  //if previous char is operator, then dot won't be added
            return
        }
        
        if hasMaxInputCount() {
            return
        }
        
        var dotFound = false
        for char in input.reversed() {
            if char == "." {
                dotFound = true
                break
            }
        }
        
        if !dotFound {
            input += "."
            fromTextField.text = input
        }
        updateConvesion()
    }
    
    @IBAction private func didTapOnZero(_ sender: Any) {
        guard var input = fromTextField.text else { return }
        
        if hasMaxInputCount() {
            return
        }
        
        if input != "0" && input.count >= 1 {
            input += "0"
            fromTextField.text = input
        } else if input.count == 0 {
            fromTextField.text = "0"
        }
        updateConvesion()
    }
    
    @IBAction private func didTapOnOne(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromTextField.text = str + "1"
        updateConvesion()
    }
    
    @IBAction private func didTapOnTwo(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromTextField.text = str + "2"
        updateConvesion()
    }
    
    @IBAction private func didTapOnThree(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromTextField.text = str + "3"
        updateConvesion()
    }
    
    @IBAction private func didTapOnFour(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromTextField.text = str + "4"
        updateConvesion()
    }
    
    @IBAction private func didTapOnFive(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromTextField.text = str + "5"
        updateConvesion()
    }
    
    @IBAction private func didTapOnSix(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromTextField.text = str + "6"
        updateConvesion()
    }
    
    @IBAction private func didTapOnSeven(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromTextField.text = str + "7"
        updateConvesion()
    }
    
    @IBAction private func didTapOnEight(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromTextField.text = str + "8"
        updateConvesion()
    }
    
    @IBAction private func didTapOnNine(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromTextField.text = str + "9"
        updateConvesion()
    }
    
    private func startsWithZero() -> String {  //if input is 0, pressing 1, 0 will be replaced by 1
        guard var input = fromTextField.text else { return "" }
        
        if input.count == 1 {
            if input[input.index(input.startIndex, offsetBy: 0)] == "0" {
                input = ""
            }
        }
        return input
    }
    
    private func hasMaxInputCount() -> Bool {
        guard let input = fromTextField.text else { return true }
        
        return !(input.count <= 10)
    }
    
    private func updateConvesion() {
        guard let amountToConv = self.fromTextField.text else { return }
        guard let baseCurRate = self.baseCur.rate else { return }
        guard let convCurRate = self.convCur.rate else { return }
    
        let amountToConvDouble = Double(amountToConv) ?? 0.0
        
//        guard let convRate = self.convCur.rate else { return }
        
        if self.baseCur.currency != "EUR" {
            let amountToEur = amountToConvDouble * 1 / baseCurRate
            let converted = amountToEur * convCurRate
            toTextField.text = String(converted)
        } else {
            let converted  = amountToConvDouble * convCurRate
            toTextField.text = String(converted)
        }
    }
}

// MARK: - Extensions

extension CurrencyConverterViewController: SpinnerViewDelegate {
    func didChooseCurrency(rate: (String, Double), type: SpinnerType) {
        switch type {
        case .from:
            self.baseCur = rate
        case .to:
            self.convCur = rate
        }
        self.fromTextField.text = "0"
        self.toTextField.text = "0"
    }
    
    func didCancelCurrency() {
        self.fromTextField.text = "0"
        self.toTextField.text = "0"
    }
}
