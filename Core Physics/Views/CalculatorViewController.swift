//
//  CalculatorViewController.swift
//  Core Physics
//
//  Created by Fotios Tragopoulos on 27/04/2018.
//  Copyright © 2018 Fotios Tragopoulos. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var textField_1: UITextField!
    @IBOutlet weak var textField_2: UITextField!
    @IBOutlet weak var textField_3: UITextField!
    @IBOutlet weak var textField_4: UITextField!
    @IBOutlet weak var textField_5: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var imagePresenterView: UIImageView!
    
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

        calculateButton.layer.cornerRadius = 5
        emailButton.layer.cornerRadius = 5
        resetButton.layer.cornerRadius = 5
        imagePresenterView.layer.cornerRadius = 5
        
        setScene()
    }
    
    func setScene() {

    }
}
