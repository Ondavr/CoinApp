//
//  CoinImageService.swift
//  CoinApp
//
//  Created by Davron Usmanov on 10/01/22.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
     
    @Published var image: UIImage? = nil
    
    private var imgaeSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel ) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        
        if let saveImage = fileManager.getImage(imageName: coin.id, folderName: folderName) {
        image = saveImage
            print("Retrieved image from File Manager !")
        } else {
            downloadCoinImage()
            print("Downloading image now")
        }
    }
    
    private func downloadCoinImage() {
        print("Downloading image now")
        guard let url = URL(string: coin.image) else {return}
        
        imgaeSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) ->UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleComplition, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadImage = returnedImage else { return }
                self.image = returnedImage
                self.imgaeSubscription?.cancel()
                self.fileManager.saveImage(image: downloadImage, imageName: self.imageName, folderName: self.folderName)
            })
        
    }
}
