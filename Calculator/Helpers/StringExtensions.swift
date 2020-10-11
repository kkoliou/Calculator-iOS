//
//  StringExtensions.swift
//  Calculator
//
//  Created by Konstantinos Kolioulis on 11/10/20.
//  Copyright © 2020 Konstantinos Kolioulis. All rights reserved.
//

import Foundation

extension String {

    var isNumeric : Bool {
        return NumberFormatter().number(from: self) != nil
    }
    
}
