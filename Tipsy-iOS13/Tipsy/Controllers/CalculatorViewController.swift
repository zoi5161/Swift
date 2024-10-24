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
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = "10.0"
    var numPeople = "2.0"
    var totalBill = "0.0"
    var calculateBrain = CalculationBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        unselectAll()
        sender.isSelected = true
        
        tip = sender.currentTitle!
        tip.removeLast()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        numPeople = splitNumberLabel.text!
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        totalBill = billTextField.text!
        calculateBrain.calculateBill(tip: tip, numPeople: numPeople, totalBill: totalBill)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBill = calculateBrain.getCost()
            destinationVC.announce = calculateBrain.getAnnounce()
            destinationVC.color = calculateBrain.getColor()
        }
    }
    
    
    func unselectAll(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
}

/*
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
     @IBOutlet weak var zeroPctButton: UIButton!
     @IBOutlet weak var tenPctButton: UIButton!
     @IBOutlet weak var twentyPctButton: UIButton!
     @IBOutlet weak var splitNumberLabel: UILabel!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         unselectAll()
     }

     @IBAction func tipChanged(_ sender: UIButton)
     {
         unselectAll()
         sender.isSelected = true
     }
     
     
     @IBAction func stepperValueChanged(_ sender: UIStepper) {
         splitNumberLabel.text = String(Int(sender.value))
     }
     
     
     @IBAction func calculatePressed(_ sender: UIButton) {
         var result = Float(billTextField.text ?? "0.0")!
         if (tenPctButton.isSelected == true){
             result *= 1.1
         }
         else if(twentyPctButton.isSelected == true){
             result *= 1.2
         }
         
         result /= Float(splitNumberLabel.text!)!
         print(String(format: "%.2f", result))
     }
     
     func unselectAll(){
         zeroPctButton.isSelected = false
         tenPctButton.isSelected = false
         twentyPctButton.isSelected = false
     }
 }

 // 0 176 107
 // 222 248 235

 */
