//
//  CalculatorViewController.swift
//  Core Physics
//
//  Created by Fotios Tragopoulos on 27/04/2018.
//  Copyright © 2018 Fotios Tragopoulos. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var _calculatorLabel: String!

    var calculatorLabel: String {
        get {
            return _calculatorLabel
        }   set {
            _calculatorLabel = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = calculatorLabel
    }
    
    
}
