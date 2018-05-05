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
    
    //Return the content of the textfield as a double
    func format(textField : UITextField) -> Double {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = NSLocale.current
        let text = String(describing: textField.text!)
        let aDouble = numberFormatter.number(from: text)?.doubleValue ?? 0.0
        let result = round(10000 * aDouble)/10000
        return result
    }
    
    func setScene() {
        // Mechanics scene
        // Kinematics
        if calculatorLabel == "Speed - Velovity" {
            textField_1.placeholder = "(d) Distance in meters"
            textField_2.placeholder = "(t) Time in seconds"
            textField_3.placeholder = "(v) Velocity in m/s"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Acceleration" {
            textField_1.placeholder = "(u) Initial Velocity in m/s"
            textField_2.placeholder = "(v) Final Velocity in m/s"
            textField_3.placeholder = "(Δt) Time in seconds"
            textField_4.placeholder = "(a) Acceleration in m/s²"
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Displacement" {
            textField_1.placeholder = "(Va) Average Velocity in m/s"
            textField_2.placeholder = "(t) Time in seconds"
            textField_3.placeholder = "(Δx) Displacement in meters"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Gravity" {
            textField_1.placeholder = "(m1) Mass in kilograms"
            textField_2.placeholder = "(m2) Mass in kilograms"
            textField_3.placeholder = "(r) Distance of Objects in meters"
            textField_4.placeholder = "(Fg) Gravitational Force in Newtons"
            textField_5.isHidden = true
            
        }
        
        // Dynamics
        else if calculatorLabel == "Force - Newton's 2nd Law" {
            textField_1.placeholder = "(m) Mass in kilograms"
            textField_2.placeholder = "(a) Acceleration in m/s²"
            textField_3.placeholder = "(F) Force in Newtons"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Friction" {
            textField_1.placeholder = "(μ) Frictional Coefficient"
            textField_2.placeholder = "(F) Normal Force in Newtons"
            textField_3.placeholder = "(f) Frictional Force in Newtons"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Centripetal Force" {
            textField_1.placeholder = "(m) Mass in kilograms"
            textField_2.placeholder = "(r) Radius in meters"
            textField_3.placeholder = "(v) Velocity in m/s"
            textField_4.placeholder = "(f) Centripetal Force in Newtons"
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Momentum" {
            textField_1.placeholder = "(m) Mass in kilograms"
            textField_2.placeholder = "(v) Velocity in m/s"
            textField_3.placeholder = "(ρ) Momentum in kg⋅m/s"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Stress" {
            textField_1.placeholder = "(f) Force in Newtons"
            textField_2.placeholder = "(a) Area in m²"
            textField_3.placeholder = "(s) Stress in Pascals"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Hooke's Law" {
            textField_1.placeholder = "(Fx) Force in Newtons"
            textField_2.placeholder = "(K) Spring Force Constant in N/m"
            textField_3.placeholder = "(x) Distance from Equilibrium in meters"
            textField_4.placeholder = "(x₀) Spring Equilibrium Position in meters"
            textField_5.isHidden = true
            
        }
       
        // Energy
        else if calculatorLabel == "Work" {
            textField_1.placeholder = "(F) Force in Newtons"
            textField_2.placeholder = "(D) Distance in meters"
            textField_3.placeholder = "(W) Work in Joules"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Kinetic Energy" {
            textField_1.placeholder = "(m) Mass in kilograms"
            textField_2.placeholder = "(v) Velocity in m/s"
            textField_3.placeholder = "(Eκ) Kinetic Energy in Joules"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Potential Energy" {
            textField_1.placeholder = "(m) Mass in kilograms"
            textField_2.placeholder = "(h) Height in meters"
            textField_3.placeholder = "(Ep) Potential Energy in Joules"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Elastic Potential Energy" {
            textField_1.placeholder = "(k) Spring Force Constant in N/m"
            textField_2.placeholder = "(x) Spring Stretch Length in meters"
            textField_3.placeholder = "(U) Spring Potential Energy in Joules"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Power" {
            textField_1.placeholder = "(w) Work in Joules"
            textField_2.placeholder = "(t) Time in seconds"
            textField_3.placeholder = "(p) Power in Watt"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        }
        
        // Rotational Motion
        else if calculatorLabel == "Angular Velocity" {
            textField_1.placeholder = "(θ) Angular Displacement in rad"
            textField_2.placeholder = "(t) Time in seconds"
            textField_3.placeholder = "(ω) Angular Velocity in rad/s"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Angular Acceleration" {
            textField_1.placeholder = "(τ) Total Torque in rad/s"
            textField_2.placeholder = "(I) Mass Moment of Inertia in kg-m²/rad²"
            textField_3.placeholder = "(α) Angular Acceleration in rad/s²"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Rotational Inertia" {
            textField_1.placeholder = "(m) Mass in kilograms"
            textField_2.placeholder = "(r) Radius in meters"
            textField_3.placeholder = "(I) Rotational Inertia in kg⋅m²"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Angular Momentum" {
            textField_1.placeholder = "(I) Rotational Inertia in kg⋅m²"
            textField_2.placeholder = "(ω) Angular Frequency in rad/s"
            textField_3.placeholder = "(L) Angular Momentum in kg⋅m²/s"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Rotational Kinetic Energy" {
            textField_1.placeholder = "(I) Rotational Inertia in kg⋅m²"
            textField_2.placeholder = "(ω) Angular Velocity in rad/s"
            textField_3.placeholder = "(Εκ) Kinetic Energy in Joules"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Rolling Friction" {
            textField_1.placeholder = "(μ) Frictional Coefficient"
            textField_2.placeholder = "(W) Weight in Newtons"
            textField_3.placeholder = "(Fr) Rolling Friction in Newtons"
            textField_4.isHidden = true
            textField_5.isHidden = true

        }
        
        // Fluids
        else if calculatorLabel == "Density" {
            textField_1.placeholder = "(m) Mass in grams"
            textField_2.placeholder = "(V) Volume in cm³"
            textField_3.placeholder = "(d) Density in gr/cm³"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Pressure" {
            textField_1.placeholder = "(F) Force in Newtons"
            textField_2.placeholder = "(A) Area in cm²"
            textField_3.placeholder = "(P) Pressure in Pascals"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Fluid Flow" {
            textField_1.placeholder = "(d) Density in kg/m³"
            textField_2.placeholder = "(A) Area in m²"
            textField_3.placeholder = "(V) Velocity in m/s"
            textField_4.placeholder = "(μ) Mass Flow Rate in kg/s"
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Volumetric Flow Rate" {
            textField_1.placeholder = "(dV) Volume Change in m³"
            textField_2.placeholder = "(dt) Time Interval in sec"
            textField_3.placeholder = "(Q) Volumetric Flow Rate in m³/s"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Reynold's Number" {
            textField_1.placeholder = "(ρ) Density in kg/m³"
            textField_2.placeholder = "(V) Velocity in m/s"
            textField_3.placeholder = "(D) Characteristic Diameter in meters"
            textField_4.placeholder = "(μ) Viscosity in N-s/m²"
            textField_5.placeholder = "(R) Reynold's Number"
            
        } else if calculatorLabel == "Buoyancy Force" {
            textField_1.placeholder = "(ρ) Fluid Density in kg/m³"
            textField_2.placeholder = "(V) Displaced Volume in m³"
            textField_3.placeholder = "(B) Buoyancy Force in Newtons"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        }
            
        // Electricity
        // Electrostatics
        else if calculatorLabel == "Coulomb's Law" {
            textField_1.placeholder = "(q₁) Charge of First Body in Coulombs"
            textField_2.placeholder = "(q₂) Charge of Second Body in Coulombs"
            textField_3.placeholder = "(d) Distance in meters"
            textField_4.placeholder = "(F) Force in Newtons"
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Electric Field" {
            textField_1.placeholder = "(F) Force in Newtons"
            textField_2.placeholder = "(q) Charge in Coulombs"
            textField_3.placeholder = "(E) Electric Field in N/C"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Gauss's Law" {
            textField_1.placeholder = "(Q) Total Charge in Coulombs"
            textField_2.placeholder = "(φ) Electric Flux in V⋅m"
            textField_3.isHidden = true
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Capacitance" {
            textField_1.placeholder = "(Q) Electric Charge in Coulombs"
            textField_2.placeholder = "(V) Potential Difference in Volts"
            textField_3.placeholder = "(C) Capacitance in farads"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Electric Dipole Moment" {
            textField_1.placeholder = "(q) Charge in Coulombs"
            textField_2.placeholder = "(d) Displacement Vector in meters"
            textField_3.placeholder = "(p) Electric Dipole Moment in C⋅m"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        }
        
        // Electric Current
        else if calculatorLabel == "Electric Current" {
            textField_1.placeholder = "(q) Charge in Coulombs"
            textField_2.placeholder = "(t) Time Taken in seconds"
            textField_3.placeholder = "(I) Electric Current in Amperes"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Ohm's Law" {
            textField_1.placeholder = "(V) Voltage in Volts"
            textField_2.placeholder = "(I) Electric Curret in Amperes"
            textField_3.placeholder = "(R) Resistance in Ohms"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Electrical Resistance" {
            textField_1.placeholder = "(ρ) Resistivity in Ω⋅m"
            textField_2.placeholder = "(L) Wire's Length in meters"
            textField_3.placeholder = "(A) Wire Cross Area in m²"
            textField_4.placeholder = "(R) Resistance in Ohms"
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Electrical Conductance" {
            textField_1.placeholder = "(I) Current in Amperes"
            textField_2.placeholder = "(V) Voltage in Volts"
            textField_3.placeholder = "(G) Conductance in Siemens"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Electric Power" {
            textField_1.placeholder = "(I) Current in Amperes"
            textField_2.placeholder = "(R) Resistance in Ohms"
            textField_3.placeholder = "(P) Electric Power in Watts"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Internal Resistance & Batteries" {
            textField_1.placeholder = "(ε) Electromotive Force in Volts"
            textField_2.placeholder = "(V) Terminal Voltage in Volts"
            textField_3.placeholder = "(I) Electric Current in Amperes"
            textField_4.placeholder = "(r) Internal Resistance in Ohms"
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Current Density" {
            textField_1.placeholder = "(I) Electric Current in Amperes"
            textField_2.placeholder = "(A) Area in m²"
            textField_3.placeholder = "(J) Current Density in Amp/m²"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Voltage Divider" {
            textField_1.placeholder = "(Vin) Input Voltage (Vin) in Volts"
            textField_2.placeholder = "(Ra) Resistance in Ohms"
            textField_3.placeholder = "(Rb) Resistance in Ohms"
            textField_4.placeholder = "(Vout) Output Voltage in Volts"
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Wheatstone's Bridge 1" {
            textField_1.placeholder = "(Ra) Resistance in Ohms"
            textField_2.placeholder = "(Rb) Resistance in Ohms"
            textField_3.placeholder = "(Rc) Resistance in Ohms"
            textField_4.placeholder = "(Rx) Resistance in Ohms"
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Wheatstone's Bridge 2" {
            textField_1.placeholder = "(Vin) Input Voltage in Volts"
            textField_2.placeholder = "(Ra) Resistance in Ohms"
            textField_3.placeholder = "(Rb) Resistance in Ohms"
            textField_4.placeholder = "(Rc) Resistance in Ohms"
            textField_5.placeholder = "(Rx) Resistance in Ohms"
            
        }
        
        // Magnetodynamics
        else if calculatorLabel == "Magnetism" {
            textField_1.placeholder = "(q) Charge in Coulombs"
            textField_2.placeholder = "(v) Velocity in m/s"
            textField_3.placeholder = "(B) Magnetic Field in Tesla"
            textField_4.placeholder = "(Fb) Magnetic Force in Newtons"
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Electromagnetic Induction" {
            textField_1.placeholder = "(B) Magnetic Flux Density in Tesla"
            textField_2.placeholder = "(I) Length of the Conductor in meters"
            textField_3.placeholder = "(v) Speed of the Conductor in m/s"
            textField_4.placeholder = "Motional e.m.f in Volts"
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Faraday's Law of Induction" {
            textField_1.placeholder = "(N) Number of Turns in Coil"
            textField_2.placeholder = "(ΔΦ) Change in Magnetic Flux in Weber"
            textField_3.placeholder = "(Δt) Change in Time in seconds"
            textField_4.placeholder = "(e.m.f) Electromotive Force in Volts"
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Inductance" {
            textField_1.placeholder = "(N) Number of Turns in Coil"
            textField_2.placeholder = "(μ) Material Permeability"
            textField_3.placeholder = "(A) Coil Area in m²"
            textField_4.placeholder = "(l) Average Coil Length in meters"
            textField_5.placeholder = "(L) Inductance in Henry"
            
        }
        
        //Waves
        //Acoustics and Optics
        else if calculatorLabel == "Frequency" {
            textField_1.placeholder = "(T) Time Period in seconds"
            textField_2.placeholder = "(f) Frequency in Hertz"
            textField_3.isHidden = true
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Wavelength - Wave Speed" {
            textField_1.placeholder = "(λ) Wavelength in meters"
            textField_2.placeholder = "(f) Frequency in Hertz"
            textField_3.placeholder = "(v) Wave Speed in m/s"
            textField_4.isHidden = true
            textField_5.isHidden = true

        } else if calculatorLabel == "Sound Intensity" {
            textField_1.placeholder = "(P) Power in Watt"
            textField_2.placeholder = "(A) Area in m²"
            textField_3.placeholder = "(I) Intensity in W/m²"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Snell's Law of Refraction" {
            textField_1.placeholder = "(c) Speed of Light in a Vacuum in m/s"
            textField_2.placeholder = "(v) Speed of Light in a Medium in m/s"
            textField_3.placeholder = "(n) Index of Refraction"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Doppler's Effect Case 1" {
            textField_1.placeholder = "(V) Velocity of Light or Sound in m/s"
            textField_2.placeholder = "(Vs) Velocity of the Source in m/s"
            textField_3.placeholder = "(f) Real Frequency in Hertz"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Doppler's Effect Case 2" {
            textField_1.placeholder = "(V) Velocity of Light or Sound in m/s"
            textField_2.placeholder = "(Vs) Velocity of the Source in m/s"
            textField_3.placeholder = "(f) Real Frequency in Hertz"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Doppler's Effect Case 3" {
            textField_1.placeholder = "(V) Velocity of Light or Sound in m/s"
            textField_2.placeholder = "(V₀) Velocity of the Observer in m/s"
            textField_3.placeholder = "(f) Real Frequency in Hertz"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Doppler's Effect Case 4" {
            textField_1.placeholder = "(V) Velocity of Light or Sound in m/s"
            textField_2.placeholder = "(V₀) Velocity of the Observer in m/s"
            textField_3.placeholder = "(f) Real Frequency in Hertz"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Doppler's Effect Case 5" {
            textField_1.placeholder = "(V) Velocity of Light or Sound in m/s"
            textField_2.placeholder = "(Vs) Velocity of the Source in m/s"
            textField_3.placeholder = "(V₀) Velocity of the Observer in m/s"
            textField_4.placeholder = "(f) Real Frequency in Hertz"
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Doppler's Effect Case 6" {
            textField_1.placeholder = "(V) Velocity of Light or Sound in m/s"
            textField_2.placeholder = "(Vs) Velocity of the Source in m/s"
            textField_3.placeholder = "(V₀) Velocity of the Observer in m/s"
            textField_4.placeholder = "(f) Real Frequency in Hertz"
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Doppler's Effect Case 7" {
            textField_1.placeholder = "(V) Velocity of Light or Sound in m/s"
            textField_2.placeholder = "(Vs) Velocity of the Source in m/s"
            textField_3.placeholder = "(V₀) Velocity of the Observer in m/s"
            textField_4.placeholder = "(f) Real Frequency in Hertz"
            textField_5.isHidden = true
            
        }
        
        // Other
        //Thermal Physics
        else if calculatorLabel == "Sensible Heat" {
            textField_1.placeholder = "(m) Mass in kilograms"
            textField_2.placeholder = "(c) Specific Heat in J/kg⋅⁰C"
            textField_3.placeholder = "(ΔΤ) Change in Temperature in ⁰C"
            textField_4.placeholder = "(Q) Heat Energy in Joules"
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Thermodynamic's 1st Law" {
            textField_1.placeholder = "(ΔU) Internal Energy Increase in Joules"
            textField_2.placeholder = "(ΔW) Work Done in Joules"
            textField_3.placeholder = "(ΔQ) Heat Given to the System in ⁰C"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Heat Capacity" {
            textField_1.placeholder = "(m) Mass in kilograms"
            textField_2.placeholder = "(s) Specific Heat in J/kg⋅⁰C"
            textField_3.placeholder = "(C) Heat Capacity in J/⁰C"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        }
        
        // Modern Physics
        else if calculatorLabel == "Einstein's Law" {
            textField_1.placeholder = "(E) Energy in Joules"
            textField_2.placeholder = "(m) Mass in kilograms"
            textField_3.isHidden = true
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Nucleon Number" {
            textField_1.placeholder = "(Z) Atomic Number"
            textField_2.placeholder = "(N) Neutrons Number"
            textField_3.placeholder = "(A) Mass Number"
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } else if calculatorLabel == "Energy Per Nucleon" {
            textField_1.placeholder = "(E) Binding Energy in Joules"
            textField_2.placeholder = "(ΔΜ) Mass Difference in kilograms"
            textField_3.isHidden = true
            textField_4.isHidden = true
            textField_5.isHidden = true
            
        } 
    }
    
    // Alert controller
    func presentAlert() {
        let titleString  = "Please fill in all the fields except for the field of the unknown value."
        let actionString = "OK"
        var titleMutableString = NSMutableAttributedString()
        
        titleMutableString = NSMutableAttributedString(string: titleString as String, attributes: [ NSAttributedStringKey.font: UIFont(name: "Courier", size: 14.0)!, NSAttributedStringKey.foregroundColor: UIColor.white,])
        
        // Blur effect
        UIVisualEffectView.appearance(whenContainedInInstancesOf: [UIAlertController.classForCoder() as! UIAppearanceContainer.Type]).effect = UIBlurEffect(style: .dark)
        
        // The actions
        let ok = UIAlertAction(title: actionString, style: .default, handler: { (action) -> Void in})
        
        // The alert message
        let alert = UIAlertController(title: titleString, message: "", preferredStyle: .alert)
        alert.setValue(titleMutableString, forKey: "attributedTitle")
        
        // The presentation
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    // The calculations
    @IBAction func calculateButtonAction(sender: Any) {
        // Mechanics scene
        // Kinematics
        if calculatorLabel == "Speed - Velovity" {
            if textField_1.text != "" && textField_2.text != "" && textField_3.text == "" {
                
            } else if textField_1.text != "" && textField_2.text == "" && textField_3.text != "" {
                
            } else if textField_1.text == "" && textField_2.text != "" && textField_3.text != "" {
                
            } else {
                presentAlert()
            }
            
        } else if calculatorLabel == "Acceleration" {
     
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
