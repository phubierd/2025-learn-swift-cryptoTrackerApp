//
//  HomeView.swift
//  SwiftfulCrypto
//
//  Created by Phú Chiêm on 15/12/25.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(HomeViewModel.self) private var vm
    @State private var showPorfolio:Bool = false
    
    var body: some View {
        @Bindable var bindableVm = vm
        
        ZStack{
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            //content layer
            VStack{
                homeHeader
                
                SearchBarView(searchText: $bindableVm.searchText)
                columnTilte
                
                if !showPorfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPorfolio {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    NavigationStack{
        HomeView()
            .toolbar(.hidden)
            .environment(Preview.dev.homeVM)
    }
   
}


extension HomeView {
    
    private var homeHeader : some View {
        HStack{
            CircleButtonView(iconName: showPorfolio ? "plus" : "info")
                .animation(.none)
                .background(
                    CircleButtonAnimationView(animate: $showPorfolio)
                )
            Spacer()
            Text(showPorfolio ? "Portfolio" :"Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPorfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPorfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList:some View{
        List{
            ForEach(vm.allCoins){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top:10,leading: 0,bottom: 10,trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
        
    }
    
    private var portfolioCoinsList:some View{
        List{
            ForEach(vm.allCoins){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top:10,leading: 0,bottom: 10,trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
        
    }
    
    private var columnTilte:some View {
        HStack{
            Text("Coin")
            Spacer()
            if showPorfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
    }
    
}
