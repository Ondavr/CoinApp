//
//  CoinDataService.swift
//  CoinApp
//
//  Created by Davron Usmanov on 09/01/22.
//

import Foundation
import Combine


class CoinDataService {

    @Published var allCoins: [CoinModel] = []
    var coinSubcription : AnyCancellable?
    
    init() {
        getCoins()
    }
    
   private func getCoins() {
       
       guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {return}
       
       coinSubcription = NetworkingManager.download(url: url)
           .decode(type: [CoinModel].self, decoder: JSONDecoder())
           .sink(receiveCompletion: NetworkingManager.handleComplition, receiveValue: { [weak self] (returnedCoins) in
               self?.allCoins = returnedCoins
               self?.coinSubcription?.cancel()
           })
       
       }
        
    }

