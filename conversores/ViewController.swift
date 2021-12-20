//
//  ViewController.swift
//  conversores
//
//  Created by Michelli Cristina de Paulo Lima on 19/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lsResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Libra", for: .normal)
                
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dólar", for: .normal)
                
            case "Moeda":
                lbUnit.text = "Distância"
                btUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("Kilômetro", for: .normal)
                
            default:
                lbUnit.text = "Temperatura"
                btUnit1.setTitle("Celsius", for: .normal)
                btUnit2.setTitle("Farenhint", for: .normal)
                
            }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            } else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        switch lbUnit.text! {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
            }
    }
    
    func calcTemperature() {
        guard let temperate = Double(tfValue.text!) else { return }
        if btUnit1.alpha == 1.0 {
            lsResultUnit.text = "Fareinheit"
            lbResult.text = String(temperate * 1.8 + 32.0)
        } else {
            lsResultUnit.text = "Celsius"
            lbResult.text = String((temperate - 1.8) + 32.0)
        }
    }
    
    func calcWeight() {
        guard let distance = Double(tfValue.text!) else { return }
        if btUnit1.alpha == 1.0 {
            lsResultUnit.text = "Kilômetro"
            lbResult.text = String(distance / 1000.0)
        } else {
            lsResultUnit.text = "Metro"
            lbResult.text = String(distance * 1000.0)
        }
    }
    
    func calcCurrency() {
        guard let weight = Double(tfValue.text!) else { return }
        if btUnit1.alpha == 1.0 {
            lsResultUnit.text = "Libra"
            lbResult.text = String(weight / 2.2046)
        } else {
            lsResultUnit.text = "Kilôgrama"
            lbResult.text = String(weight * 2.2046)
        }
    }
    
    func calcDistance() {
        guard let distance = Double(tfValue.text!) else { return }
        if btUnit1.alpha == 1.0 {
            lsResultUnit.text = "Kilômetro"
            lbResult.text = String(distance / 1000.0)
        } else {
            lsResultUnit.text = "Metro"
            lbResult.text = String(distance * 1000.0)
        }
    }
}

