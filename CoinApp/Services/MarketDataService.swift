//
//  MarketDataService.swift
//  CoinApp
//
//  Created by Davron Usmanov on 12/01/22.
//

import Foundation
import Combine


class MarketDataService {

    @Published var marketData: MarketDataModel? = nil
    var MarketDataSubcription : AnyCancellable?
    
    init() {
        getCoins()
    }
    
   private func getCoins() {
       
       guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {return}
       
       MarketDataSubcription = NetworkingManager.download(url: url)
           .decode(type: GlobalData.self, decoder: JSONDecoder())
           .sink(receiveCompletion: NetworkingManager.handleComplition, receiveValue: { [weak self] (returnedGlobalData) in
               self?.marketData = returnedGlobalData.data
               self?.MarketDataSubcription?.cancel()
           })
       
       }
        
    }
