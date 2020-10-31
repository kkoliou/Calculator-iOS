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
    @IBOutlet private weak var contentView: UIControl!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var arrowIcon: UIImageView!
    
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
    
    @IBAction private func didTapOnView(_ sender: Any) {
        delegate?.didTapOnView()
    }
    
}
