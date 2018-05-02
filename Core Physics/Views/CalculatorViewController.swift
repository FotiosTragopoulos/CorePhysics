//
//  CalculatorViewController.swift
//  Core Physics
//
//  Created by Fotios Tragopoulos on 27/04/2018.
//  Copyright © 2018 Fotios Tragopoulos. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var textField_1: YoshikoTextField!
    @IBOutlet weak var textField_2: UITextField!
    @IBOutlet weak var textField_3: UITextField!
    @IBOutlet weak var textField_4: UITextField!
    @IBOutlet weak var textField_5: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var functionsButton: UIButton!
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
        functionsButton.layer.cornerRadius = 5
        resetButton.layer.cornerRadius = 5
        imagePresenterView.layer.cornerRadius = 5
        textField_1.layer.cornerRadius = 5
        textField_2.layer.cornerRadius = 5
        textField_3.layer.cornerRadius = 5
        textField_4.layer.cornerRadius = 5
        textField_5.layer.cornerRadius = 5
        
        setScene()
    }
    
    func setScene() {
        // Mechanics scene
        // Kinematics
        if calculatorLabel == "Speed - Velovity" {
            textField_4.isHidden = true
            textField_5.isHidden = true
            textField_1.placeholder = "(d) Distance in meters"
            textField_2.placeholder = "(t) Time in seconds"
            textField_3.placeholder = "(v) Velocity in m/s"

        } else if calculatorLabel == "Acceleration" {
            textField_5.isHidden = true
        } else if calculatorLabel == "Displacement" {
            
        } else if calculatorLabel == "Gravity" {
            
        }
        
        // Dynamics
        else if calculatorLabel == "Force - Newton's 2nd Law" {
            
        } else if calculatorLabel == "Friction" {
            
        } else if calculatorLabel == "Centripetal Force" {
            
        } else if calculatorLabel == "Momentum" {
            
        } else if calculatorLabel == "Stress" {
            
        } else if calculatorLabel == "Hooke's Law" {
            
        }
       
        // Energy
        else if calculatorLabel == "Work" {
            
        } else if calculatorLabel == "Kinetic Energy" {
            
        } else if calculatorLabel == "Potential Energy" {
            
        } else if calculatorLabel == "Elastic Potential Energy" {
            
        } else if calculatorLabel == "Power" {
            
        }
        
        // Rotational Motion
        else if calculatorLabel == "Angular Velocity" {
            
        } else if calculatorLabel == "Angular Acceleration" {
            
        } else if calculatorLabel == "Rotational Inertia" {
            
        } else if calculatorLabel == "Angular Momentum" {
            
        } else if calculatorLabel == "Rotational Kinetic Energy" {
            
        } else if calculatorLabel == "Rolling Friction" {
            
        }
        
        // Fluids
        else if calculatorLabel == "Density" {
            
        } else if calculatorLabel == "Pressure" {
            
        } else if calculatorLabel == "Fluid Flow" {
            
        } else if calculatorLabel == "Volumetric Flow Rate" {
            
        } else if calculatorLabel == "Reynold's Number" {
            
        } else if calculatorLabel == "Buoyancy Force" {
            
        }
            
        // Electricity
        // Electrostatics
        else if calculatorLabel == "Coulomb's Law" {
            
        } else if calculatorLabel == "Electric Field" {
            
        } else if calculatorLabel == "Gauss's Law" {
            
        } else if calculatorLabel == "Capacitance" {
            
        } else if calculatorLabel == "Electric Dipole Moment" {
            
        }
        
        // Electric Current
        else if calculatorLabel == "Electric Current" {
            
        } else if calculatorLabel == "Ohm's Law" {
            
        } else if calculatorLabel == "Electrical Resistance" {
            
        } else if calculatorLabel == "Electrical Conductance" {
            
        } else if calculatorLabel == "Electric Power" {
            
        } else if calculatorLabel == "Internal Resistance & Batteries" {
            
        } else if calculatorLabel == "Current Density" {
            
        } else if calculatorLabel == "Voltage Divider" {
            
        } else if calculatorLabel == "Wheatstone's Bridge 1" {
            
        } else if calculatorLabel == "Wheatstone's Bridge 2" {
            
        }
        
        // Magnetodynamics
        else if calculatorLabel == "Magnetism" {
            
        } else if calculatorLabel == "Electromagnetic Induction" {
            
        } else if calculatorLabel == "Faraday's Law of Induction" {
            
        } else if calculatorLabel == "Inductance" {
            
        }
        
        //Waves
        //Acoustics and Optics
        else if calculatorLabel == "Frequency" {
            
        } else if calculatorLabel == "Wavelength - Wave Speed" {
            
        } else if calculatorLabel == "Sound Intensity" {
            
        } else if calculatorLabel == "Snell's Law of Refraction" {
            
        } else if calculatorLabel == "Doppler's Effect Case 1" {
            
        } else if calculatorLabel == "Doppler's Effect Case 2" {
            
        } else if calculatorLabel == "Doppler's Effect Case 3" {
            
        } else if calculatorLabel == "Doppler's Effect Case 4" {
            
        } else if calculatorLabel == "Doppler's Effect Case 5" {
            
        } else if calculatorLabel == "Doppler's Effect Case 6" {
            
        } else if calculatorLabel == "Doppler's Effect Case 7" {
            
        }
        
        // Other
        //Thermal Physics
        else if calculatorLabel == "Sensible Heat" {
            
        } else if calculatorLabel == "Thermodynamic's 1st Law" {
            
        } else if calculatorLabel == "Heat Capacity" {
            
        }
        
        // Modern Physics
        else if calculatorLabel == "Einstein's Law" {
            
        } else if calculatorLabel == "Nucleon Number" {
            
        } else if calculatorLabel == "Energy Per Nucleon" {
            
        } 
    }
}
