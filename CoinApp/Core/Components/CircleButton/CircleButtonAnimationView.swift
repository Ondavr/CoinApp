//
//  CircleButtonAnimationView.swift
//  CoinApp
//
//  Created by Davron Usmanov on 09/01/22.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animation: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            
            .scale(animation ? 1.0 : 0)
            .opacity(animation ? 0 : 1)
            .foregroundColor(Color.theme.red)
            .animation(animation ? Animation.easeOut(duration: 1.0) : .none)
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animation: .constant(false))
            .frame(width: 100, height: 100)
    }
}
