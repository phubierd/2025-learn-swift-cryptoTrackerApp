//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Phú Chiêm on 16/12/25.
//

import Foundation
import Combine

@Observable
class HomeViewModel{
    var allCoins:[CoinModel] = []
    var portfolioCoins: [CoinModel] = []
    
    var searchText:String = ""
    
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubcribers()
    }
    
 
    func addSubcribers(){
        dataService.$allCoins
            .sink {[weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
}
