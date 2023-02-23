//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var splitLabel: UILabel!
    
    var tipSelected: Double = 0.0
    var percentageSelected: String = "10%"
    var resultByPerson: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.resultByPerson = resultByPerson
            resultVC.numberOfPeople = String(Int(splitStepper.value))
            resultVC.percentage = percentageSelected
        }
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        let tipDictionary = ["0%": 0.0, "10%": 0.1, "20%": 0.2]
        
        tipSelected = tipDictionary[sender.currentTitle!] ?? 0.0
        percentageSelected = sender.currentTitle!
        
        let buttonsArray = [zeroButton, tenButton, twentyButton]
        for item in buttonsArray {
            item?.isSelected = false
        }
        
        sender.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    
        billTextField.endEditing(true)
        
        let peopleNumber = Int(splitStepper.value)
        
        guard let billTotal = Double(billTextField.text ?? "0.0") else { return }
        
        let billWithTip = billTotal + (billTotal * tipSelected)
        
        let totalPerPerson = billWithTip/Double(peopleNumber)
                
        resultByPerson = String(format: "%.2f", totalPerPerson)
        self.performSegue(withIdentifier: "goToResult", sender: self)

    }
    
    
}

