//
//  CryptoCurrency.swift
//  CryptoSwitUI
//
//  Created by Muhammed fatih Elçi on 15.12.2023.
//

import Foundation

struct CryptoCurrency: Hashable, Decodable,Identifiable {
    
    let id = UUID()
    let currency: String
    let price: String
    
    //burda internten cektigimiz verilerin degken adlarina gore duzenleme yapilabilir
    private enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
}
