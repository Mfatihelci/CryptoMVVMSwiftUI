//
//  ContentView.swift
//  CryptoSwitUI
//
//  Created by Muhammed fatih Elçi on 15.12.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListViewModel: CryptoListViewModel
    
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
        NavigationView {
            
            List(cryptoListViewModel.cryptoList) { crypto in
                Text(crypto.currency)
                Text(crypto.price)
            }
        }
    }
}

#Preview {
    MainView()
}
