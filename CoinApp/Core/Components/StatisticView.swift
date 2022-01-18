//
//  StatisticView.swift
//  CoinApp
//
//  Created by Davron Usmanov on 12/01/22.
//

import SwiftUI

struct StatisticView: View {
    let start: StatisticModel
    var body: some View {
        ZStack{
            VStack(spacing:4){
                Text(start.title)
                    .foregroundColor(Color.theme.secondaryText)
                    .font(.caption)
                Text(start.value)
                    .foregroundColor(Color.theme.accent)
                    .font(.headline)
                HStack(spacing:4){
                    Image(systemName: "triangle.fill")
                        .font(.caption2)
                        .rotationEffect(Angle(degrees: (start.persentageChange ?? 0) >= 0 ? 0 : 180))
                    
                    Text(start.persentageChange?.asPercentString() ?? "" )
                        .font(.caption)
                        .bold()
                }
                .foregroundColor((start.persentageChange ?? 0 ) >= 0 ? Color.theme.green : Color.theme.red)
                .opacity(start.persentageChange == nil ? 0.0 : 1.0)
            }
       
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(start: dev.start1)
    }
}
