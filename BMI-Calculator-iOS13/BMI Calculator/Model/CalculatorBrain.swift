//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by macOS on 5/6/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

let Color = ["Underweight" : #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), "Healthy" :  #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), "Overweight":  #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), "No color": #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]

struct CalculatorBrain{
    var bmi : BMI?
    
    mutating func calculateBMI (height : Float, weight: Float){
        let bmiValue = weight / pow(height, 2)
        
        if(bmiValue < 18.5){
            bmi = BMI(value: bmiValue, advice: "Underweight", color: Color["Underweight"]!)
        }
        else if(bmiValue < 25){
            bmi = BMI(value: bmiValue, advice: "Normal weight", color: Color["Healthy"]!)
        }
        else{
            bmi = BMI(value: bmiValue, advice: "Overweight", color: Color["Overweight"]!)
        }
    }
    
    func getBMI() -> String{
        let bmiToDecimal = String(format: "%.1f", bmi?.value ?? "0.0")
        return bmiToDecimal
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "No advice."
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? Color["No color"]!
    }
}

