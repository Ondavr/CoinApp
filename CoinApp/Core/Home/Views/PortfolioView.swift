//
//  PortfolioView.swift
//  CoinApp
//
//  Created by Davron Usmanov on 13/01/22.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectionCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckMark: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    SearchBarView(textFieldText: $vm.searchText)
                    coinLogo
                    
                    if selectionCoin != nil {
                        portfolioInputSelection
                    }
                }
                
            }
            .navigationTitle("Edit portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarButton
                }
            })
            .onChange(of: vm.searchText) { value in
                if value == "" {
                    removerSelectionCoin()
                }
            }
            
        }
        
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}


extension PortfolioView {
    private var coinLogo: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10){
                ForEach(vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                selectionCoin = coin
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectionCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1)
                        )
                }
            }
            .frame(height: 120)
            .padding(.leading)
        }
    }
    
 
   private func getCurrentPrice() -> Double {
       if let quantity = Double(quantityText){
           return quantity * (selectionCoin?.currentPrice ?? 0)
       }
       return 0
    }
    
    private var portfolioInputSelection : some View {
        
        VStack(spacing:20) {
            HStack {
                Text("Current price of \(selectionCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectionCoin?.currentPrice.asCurrencyWithDecimals() ?? "")
            }
            Divider()
            HStack{
                Text("Amount holding:")
                Spacer()
                TextField("Ex. 1.14", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack{
                Text("Current valur:")
                Spacer()
                Text(getCurrentPrice().asCurrencyWithDecimals())
                
            }
        }
        .animation(.none)
        .padding()
        .font(.headline)
    }
    
    private var trailingNavBarButton: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckMark ? 1.0 : 0)
            
            Button {
               saveButtonPressed()
            } label: {
                Text("Save".uppercased())
                    .opacity(
                        (selectionCoin != nil && selectionCoin?.currentHoldings != Double(quantityText)) ? 1.0 : 0.0
                    )
            }

        }
        .font(.headline)
    }
    
    private func saveButtonPressed() {
        
        guard let coin = selectionCoin else { return }
        
        // save to portfolio
        
        //show checkmark
        withAnimation {
            showCheckMark = true
            removerSelectionCoin()
        //hide keyboard
            UIApplication.shared.endEditing()
        //hide checkmark
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(.easeOut) {
                    showCheckMark = false
                }
            }
        }
    }
    
    private func removerSelectionCoin() {
        selectionCoin = nil
        
        vm.searchText = ""
    }
}

