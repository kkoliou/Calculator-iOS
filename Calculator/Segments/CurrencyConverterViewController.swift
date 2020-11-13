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
    @IBOutlet private weak var fromLabel: UILabel!
    @IBOutlet private weak var toLabel: UILabel!
    private var baseCur: String?
    private var convCur: String?
    
    private var rates = [String?: Double?]()
    private var currencies: [(currency: String, rate: Double)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        fromSpinnerView.delegate = self
        toSpinnerView.delegate = self
        fromLabel.text = "0"
        toLabel.text = "0"
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
        self.fromSpinnerView.update(with: currencies)
        self.toSpinnerView.update(with: currencies)
    }
    
    // MARK: - Button Actions
    
    @IBAction private func didTapOnClearAll(_ sender: Any) {
        fromLabel.text = "0"
    }
    
    @IBAction private func didTapOnDelete(_ sender: Any) {
        guard var input = fromLabel.text else { return }
        
        if input.count > 1 {
            input = String(input.dropLast())
            fromLabel.text = input
        } else {
            fromLabel.text? = "0"
        }
    }
    
    @IBAction private func didTapOnDot(_ sender: Any) {
        guard var input = fromLabel.text else { return }
        
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
            fromLabel.text = input
        }
    }
    
    @IBAction private func didTapOnZero(_ sender: Any) {
        guard var input = fromLabel.text else { return }
        
        if hasMaxInputCount() {
            return
        }
        
        if input != "0" && input.count >= 1 {
            input += "0"
            fromLabel.text = input
        } else if input.count == 0 {
            fromLabel.text = "0"
        }
    }
    
    @IBAction private func didTapOnOne(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromLabel.text = str + "1"
    }
    
    @IBAction private func didTapOnTwo(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromLabel.text = str + "2"
    }
    
    @IBAction private func didTapOnThree(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromLabel.text = str + "3"
    }
    
    @IBAction private func didTapOnFour(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromLabel.text = str + "4"
    }
    
    @IBAction private func didTapOnFive(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromLabel.text = str + "5"
    }
    
    @IBAction private func didTapOnSix(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromLabel.text = str + "6"
    }
    
    @IBAction private func didTapOnSeven(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromLabel.text = str + "7"
    }
    
    @IBAction private func didTapOnEight(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromLabel.text = str + "8"
    }
    
    @IBAction private func didTapOnNine(_ sender: Any) {
        if hasMaxInputCount() {
            return
        }
        
        let str = startsWithZero()
        fromLabel.text = str + "9"
    }
    
    private func startsWithZero() -> String {  //if input is 0, pressing 1, 0 will be replaced by 1
        guard var input = fromLabel.text else { return "" }
        
        if input.count == 1 {
            if input[input.index(input.startIndex, offsetBy: 0)] == "0" {
                input = ""
            }
        }
        return input
    }
    
    private func hasMaxInputCount() -> Bool {
        guard let input = fromLabel.text else { return true }
        
        return !(input.count <= 10)
    }

}

extension CurrencyConverterViewController: SpinnerViewDelegate {
    func didChooseCurrency() {
        return
    }
}
