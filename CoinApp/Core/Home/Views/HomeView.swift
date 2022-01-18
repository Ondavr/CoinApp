//
//  HomeView.swift
//  CoinApp
//
//  Created by Davron Usmanov on 08/01/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false // animate right
    @State private var showPortfolioView: Bool = false // new sheet
    
    var body: some View {
        ZStack{
            Color.theme.background
                .sheet(isPresented: $showPortfolioView) {
                PortfolioView()
                        .environmentObject(vm)
            }
            
            VStack{
                
                homeHeader
                HomeStatisticView(showPortfolio: $showPortfolio)
                SearchBarView(textFieldText: $vm.searchText)
                columnTitle

                if !showPortfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                    
                }
                
                if showPortfolio{
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
                
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView{
            HomeView()
                .navigationBarHidden(true)
            
        }
        .environmentObject(dev.homeVM)
    }
}


extension HomeView {
    private var homeHeader: some View {
        
        HStack{
            
            CircleButtonView(iconeName: showPortfolio ? "plus" : "info" )
                .animation(.none)
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }
                }
                .background(
                    CircleButtonAnimationView(animation: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio " : "Header")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
                
            Spacer()
            CircleButtonView(iconeName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    
    private var allCoinsList: some View {
        List{
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
        .accessibilityHidden(true)
    }
    
    private var portfolioCoinsList: some View {
        List{
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitle: some View{
        HStack{
            Text("Coin")
            Spacer()
            if showPortfolio{
                Text("Holding")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
    
}
