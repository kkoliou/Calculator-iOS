//
//  SpinnerView.swift
//  Calculator
//
//  Created by Konstantinos Kolioulis on 30/10/20.
//  Copyright © 2020 Konstantinos Kolioulis. All rights reserved.
//

import UIKit

enum SpinnerType {
    case from
    case to
}

protocol SpinnerViewDelegate: class {
    func didChooseCurrency(rate: (String, Double), type: SpinnerType)
    func didCancelCurrency()
}

@IBDesignable
final class SpinnerView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var arrowIcon: UIImageView!
    
    private var rates: [(currency: String, rate: Double)] = []
    private var type: SpinnerType?
    
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
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(donePressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelPressed))

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        textField.inputView = pickerView
        textField.inputAccessoryView = toolBar
        textField.tintColor = .clear
    }
    
    private func setupNib() {
        let bundle = Bundle(for: Swift.type(of: self))
        let nib = UINib(nibName: "SpinnerView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        addSubview(view)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view = view
    }
    
    @objc private func donePressed() {
        self.textField.endEditing(true)
    }
    
    @objc private func cancelPressed() {
        self.textField.endEditing(true)
        self.textField.text = ""
        delegate?.didCancelCurrency()
    }
    
    func update(with rates: [(currency: String, rate: Double)], type: SpinnerType) {
        self.rates = rates
        self.type = type
    }
}

extension SpinnerView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.rates.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.rates[row].currency
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let type = self.type else { return }
        textField.text = self.rates[row].currency
        delegate?.didChooseCurrency(rate: self.rates[row], type: type)
    }
}
