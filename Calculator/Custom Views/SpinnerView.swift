//
//  SpinnerView.swift
//  Calculator
//
//  Created by Konstantinos Kolioulis on 30/10/20.
//  Copyright © 2020 Konstantinos Kolioulis. All rights reserved.
//

import UIKit

protocol SpinnerViewDelegate: class {
    func didTapOnView()
}

@IBDesignable
final class SpinnerView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var arrowIcon: UIImageView!
    
    private var keys = [String]()
    private var values = [Double]()
    
    weak var delegate: SpinnerViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        setupNib()
        
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        textField.inputView = pickerView
        textField.tintColor = .clear
    }
    
    private func setupNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "SpinnerView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        addSubview(view)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view = view
    }
    
    func update(ratesKeys: [String], ratesValues: [Double]) {
        self.keys = ratesKeys
        self.values = ratesValues
    }
}

extension SpinnerView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.keys.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.keys[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = self.keys[row]
    }
}
