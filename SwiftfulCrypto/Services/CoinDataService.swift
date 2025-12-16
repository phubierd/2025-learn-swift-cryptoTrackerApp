//
//  CoinDataService.swift
//  SwiftfulCrypto
//
//  Created by Phú Chiêm on 16/12/25.
//

import Foundation
import Combine
class CoinDataService{
    
    @Published var allCoins:[CoinModel] = []
    var coinSubscription:AnyCancellable?
    
    init(){
        getCoins()
    }
    
    private func getCoins(){
    
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_des&per_page=250&page=1&sparkline=true&price_change_percentage=24h")else {return}
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompetion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }
    
}
