//
//  ViewController.swift
//  Swtcenn-practice
//
//  Created by Kulagin Stepan on 3/16/21.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var celciumTextField: UITextField!
    @IBOutlet weak var farenheitTextField: UITextField!
    @IBOutlet weak var kelvinTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func celciumTextFieldEditindDidChanged(_ sender: Any) {
        let celcium = Double(celciumTextField.text ?? "nil")
        if celcium != nil {
            farenheitTextField.text = String(format: "%.2f", celciumToFarenheit(value: celcium!))
            
            kelvinTextField.text = String(format: "%.2f", celcium! + 273.15)
        } else {
            farenheitTextField.text = ""
            kelvinTextField.text = ""
        }
    }
    
    @IBAction func farenheitTextFieldEditindDidChanged(_ sender: Any) {
        let farenheit = Double(farenheitTextField.text ?? "nil")
        if farenheit != nil {
            celciumTextField.text = String(format: "%.2f", farenheitToCelcium(value: farenheit!))
            
            kelvinTextField.text = String(format: "%.2f", farenheitToCelcium(value: farenheit!) + 273.15)
        } else {
            celciumTextField.text = ""
            kelvinTextField.text = ""
        }
    }
    @IBAction func kelvinTextFieldEditindDidChanged(_ sender: Any) {
        let kelvin = Double(kelvinTextField.text ?? "nil")
        if kelvin != nil {
            celciumTextField.text = String(format: "%.2f", kelvin! - 273.15)
            farenheitTextField.text = String(format: "%.2f", celciumToFarenheit(value: kelvin! - 273.15))
        } else {
            celciumTextField.text = ""
            farenheitTextField.text = ""
        }
    }
    
    func celciumToFarenheit(value celcium: Double) -> Double {
        return celcium * 1.8 + 32
    }
    
    func farenheitToCelcium(value farenheit: Double) -> Double {
        return (farenheit - 32) / 1.8
    }
}

