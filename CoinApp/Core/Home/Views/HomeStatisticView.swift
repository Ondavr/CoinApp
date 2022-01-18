//
//  HomeStatisticView.swift
//  CoinApp
//
//  Created by Davron Usmanov on 12/01/22.
//

import SwiftUI

struct HomeStatisticView: View {
    
    @EnvironmentObject var vm:HomeViewModel
    @Binding var showPortfolio: Bool
    var body: some View {
        HStack{
            ForEach(vm.statistics) { stat in
                StatisticView(start: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading)
    }
}

struct HomeStatisticView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatisticView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
