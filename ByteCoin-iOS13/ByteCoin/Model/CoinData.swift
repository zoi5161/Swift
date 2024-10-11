//
//  CoinData.swift
//  ByteCoin
//
//  Created by macOS on 3/9/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData : Decodable{
    let asset_id_quote : String
    let rate : Double
}
