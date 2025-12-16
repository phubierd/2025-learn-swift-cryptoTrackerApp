//
//  CoinImageViewModel.swift
//  SwiftfulCrypto
//
//  Created by Phú Chiêm on 16/12/25.
//

import Foundation
import SwiftUI
import Combine

@Observable class CoinImageViewModel {
    var image:UIImage? = nil
    var isLoading:Bool = false
    
    private let coin:CoinModel
    private let dataService:CoinImageService
    private var cancellables:Set<AnyCancellable> = []
    
    init(coin:CoinModel){
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        addSubcribers()
        self.isLoading = true
    }
    
    private func addSubcribers(){
        dataService.$image
            .sink {[weak self] (_) in
                self?.isLoading = false
            } receiveValue: {[weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
