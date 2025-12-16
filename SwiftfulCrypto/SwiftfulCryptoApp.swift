//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Phú Chiêm on 15/12/25.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    
    @State private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomeView()
                    .toolbar(.hidden)
            }
            .environment(vm)
        }
    }
}
