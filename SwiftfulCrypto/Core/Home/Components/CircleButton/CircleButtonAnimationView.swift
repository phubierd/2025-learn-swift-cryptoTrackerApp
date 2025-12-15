//
//  CircleButtonAnimationView.swift
//  SwiftfulCrypto
//
//  Created by Phú Chiêm on 15/12/25.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate:Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(true))
        .foregroundStyle(.red)
        .frame(width: 100,height: 100)
}
