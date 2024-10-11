//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var costCoin: UILabel!
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var currentPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPicker.dataSource = self
        currentPicker.delegate = self
        coinManager.delegate = self
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoin(currency: selectedCurrency)
    }
}

// MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate{
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel) {
        DispatchQueue.main.async {
            let cost = coin.price
            self.costCoin.text = String(format: "%.2f", cost)
            self.coinLabel.text = coin.typePrice
        }
    }

    func didFailWithError(error: Error){
        print(error)
    }
}
