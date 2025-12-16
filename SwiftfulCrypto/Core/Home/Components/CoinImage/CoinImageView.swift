//
//  CoinImageView.swift
//  SwiftfulCrypto
//
//  Created by Phú Chiêm on 16/12/25.
//

import SwiftUI

struct CoinImageView: View {
    
    @State var vm:CoinImageViewModel
    
    init(coin:CoinModel){
        _vm = State(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack{
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }else if vm.isLoading{
                ProgressView()
            }else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
}

#Preview {
    CoinImageView(coin:Preview.dev.coin)
}
