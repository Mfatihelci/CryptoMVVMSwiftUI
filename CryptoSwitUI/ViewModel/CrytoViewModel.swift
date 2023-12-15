//
//  CrytoViewModel.swift
//  CryptoSwitUI
//
//  Created by Muhammed fatih Elçi on 15.12.2023.
//

import Foundation
//mulakatlarda cikabilir
class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    let webservice = WebService()
    
    func dowloadCrypts(url: URL) {
        
        webservice.dowloadCurrencies(url: url) { result in
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let cryptos):
                if let cryptos = cryptos {
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)//burda cryptolist ile crypto farkli oldugu icin map ile cevirme yapiyoruz
                    }
                }
            }
        }
    }
}

struct CryptoViewModel {
    
    let crypto: CryptoCurrency
    
    var id: UUID? {
        crypto.id
    }
    
    var currency: String {
        crypto.currency
    }
    
    var price: String {
        crypto.price
    }
}
