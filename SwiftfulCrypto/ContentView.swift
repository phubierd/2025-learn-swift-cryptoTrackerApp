//
//  ContentView.swift
//  SwiftfulCrypto
//
//  Created by Phú Chiêm on 15/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background.ignoresSafeArea()
            
            VStack{
                Text("Accent color")
                    .foregroundColor(Color.theme.accent)
                
                Text("Secondary color")
                    .foregroundStyle(Color.theme.secondaryText)
                
                Text("Red color")
                    .foregroundStyle(Color.theme.red)
                    
                Text("Green Color")
                    .foregroundStyle(Color.theme.green)
            }
        }
    }
}

#Preview {
    ContentView()
}
