//
//  NetworkingManager.swift
//  CoinApp
//
//  Created by Davron Usmanov on 10/01/22.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworningError: LocalizedError {
        case badURLResponce(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponce(url: let url): return "[🔥] Bad response from URL:\(url)"
            case .unknown: return "[⚠️] Unknown error occured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponce(output: $0, url: url) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponce(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        
        guard let response =  output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
                  throw NetworningError.badURLResponce(url: url)
              }
        return output.data
        
    }
    
    static func handleComplition(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case.failure(let error) :
            print(error.localizedDescription)
        }
    }
    
}
