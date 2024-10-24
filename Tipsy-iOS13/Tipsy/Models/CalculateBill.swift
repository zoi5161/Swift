//
//  CalculateBill.swift
//  Tipsy
//
//  Created by macOS on 12/6/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

var colorArray = ["Low": #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), "Medium": #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), "High": #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), "No color": #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]

struct CalculationBrain{
    
    var bill : Bill?
    
    mutating func calculateBill(tip: String, numPeople: String, totalBill: String){
        let tipD = Double(tip) ?? 0.0
        let numPeopleD = Double(numPeople) ?? 1.0
        let totalBillD = Double(totalBill) ?? 0.0
        let total = (totalBillD * (tipD + 100.0)/100.0) / numPeopleD
        let announceResult = "Split between \(numPeople) people, with \(tip)% tip."
        let colorResult = colorArray["No color"]
        
//        if(total < 50){
//            colorResult = colorArray["Low"]
//        }
//        else if(total < 100){
//            colorResult = colorArray["Medium"]
//        }
//        else{
//            colorResult = colorArray["High"]
//        }
        
        bill = Bill(cost: String(format: "%.2f", total), announce: announceResult, color: colorResult!)
    }
    
    func getCost() -> String{
        return bill?.cost ?? "0.0"
    }
    
    func getAnnounce() -> String{
        return bill?.announce ?? "Not announce!!!"
    }
    
    func getColor() -> UIColor{
        return bill?.color ?? colorArray["No color"]!
    }
}


