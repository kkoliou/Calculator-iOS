//
//  ViewController.swift
//  Calculator
//
//  Created by Konstantinos Kolioulis on 16/8/20.
//  Copyright © 2020 Konstantinos Kolioulis. All rights reserved.
//

import UIKit
import Alamofire

final class BaseViewController: UIViewController {

    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    
    private let calculatorVC = CalculatorViewController()
    private let currencyConverterVC = CurrencyConverterViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        setupView()
    }
    
    private func setupView() {
        if !isConnectedToInternet() {
            segmentedControl.isHidden = true
            
            let alert = UIAlertController(title: "No internet connection!",
                                          message: "Currency conversion is not available.",
                                          preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    private func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: currencyConverterVC)
            add(asChildViewController: calculatorVC)
        } else {
            remove(asChildViewController: calculatorVC)
            add(asChildViewController: currencyConverterVC)
        }
    }
    
    @IBAction private func didChangeSegmentControl(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
    private func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
