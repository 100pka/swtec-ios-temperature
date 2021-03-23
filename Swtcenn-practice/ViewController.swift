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
    
    enum GradeType: Int {
        case celcium
        case farenheit
        case kelvin
    }
    
    enum ConstValues {
        static let kelvinDiff = 273.15
        static let celciumToFarenheitMultiplier = 1.8
        static let celciumToFarenheitDiff = 32.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        celciumTextField.tag = 0
        farenheitTextField.tag = 1
        kelvinTextField.tag = 2
    }
    
    @IBAction func textFieldEditingdDidChanged(_ sender: UITextField) {
        switch sender.tag {
        case GradeType.celcium.rawValue:
            guard let celciumText = celciumTextField.text,
                  let celciumValue = Double(celciumText),
                  let farenheitValue = convertGrade(from: .celcium, to: .farenheit, celciumValue),
                  let kelvinValue = convertGrade(from: .celcium, to: .kelvin, celciumValue)
            else {
                farenheitTextField.text = ""
                kelvinTextField.text = ""
                return
            }
            farenheitTextField.text = String(format: "%.2f", farenheitValue)
            kelvinTextField.text = String(format: "%.2f", kelvinValue)
            
        case GradeType.farenheit.rawValue:
            guard let farenheitText = farenheitTextField.text,
                  let farenheitValue = Double(farenheitText),
                  let celciumValue = convertGrade(from: .farenheit, to: .celcium, farenheitValue),
                  let kelvinValue = convertGrade(from: .celcium, to: .kelvin, celciumValue)
            else {
                celciumTextField.text = ""
                kelvinTextField.text = ""
                return
            }
            celciumTextField.text = String(format: "%.2f", celciumValue)
            kelvinTextField.text = String(format: "%.2f", kelvinValue)
            
        case GradeType.kelvin.rawValue:
            guard let kelvinText = kelvinTextField.text,
                  let kelvinValue = Double(kelvinText),
                  let celciumValue = convertGrade(from: .kelvin, to: .celcium, kelvinValue),
                  let farenheitValue = convertGrade(from: .celcium, to: .farenheit, celciumValue)
            else {
                farenheitTextField.text = ""
                celciumTextField.text = ""
                return
            }
            farenheitTextField.text = String(format: "%.2f", farenheitValue)
            celciumTextField.text = String(format: "%.2f", celciumValue)
        default:
            return
        }
    }
    
    private func convertGrade(from initialType: GradeType, to requiredType: GradeType, _ value: Double) -> Double? {
        let convertDirection = (initialType, requiredType)
        switch convertDirection {
        case (.celcium, .farenheit):
            return celciumToFarenheit(value: value)
        case (.farenheit, .celcium):
            return farenheitToCelcium(value: value)
        case (.kelvin, .celcium):
            return kelvinToCelcium(value: value)
        case (.celcium, .kelvin):
            return celciumToKelvin(value: value)
        default:
            return nil
        }
    }
    
    private func celciumToFarenheit(value celcium: Double) -> Double {
        return celcium * ConstValues.celciumToFarenheitMultiplier + ConstValues.celciumToFarenheitDiff
    }
    
    private func farenheitToCelcium(value farenheit: Double) -> Double {
        return (farenheit - ConstValues.celciumToFarenheitDiff) / ConstValues.celciumToFarenheitMultiplier
    }
    
    private func kelvinToCelcium(value kelvin: Double) -> Double {
        return kelvin - ConstValues.kelvinDiff
    }
    
    private func celciumToKelvin(value celcium: Double) -> Double {
        return celcium + ConstValues.kelvinDiff
    }
}

