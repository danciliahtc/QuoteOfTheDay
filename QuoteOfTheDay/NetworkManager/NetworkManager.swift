//
//  NetworkManager.swift
//  QuoteOfTheDay
//
//  Created by Dancilia Harmon   on 2/10/25.
//  Handles the network request for fetching a quote from Forismatic API

import Foundation
import Combine

protocol NetworkManagerProtocol {
    func fetchQuote(from url: URL, completion: @escaping (Result<Quote, Error>) -> Void)
}

// used for testing the app with mock data, without relying on the actual API
class MockNetworkManager: NetworkManagerProtocol {
    func fetchQuote(from url: URL, completion: @escaping (Result<Quote, Error>) -> Void) {
        let mockQuote = Quote(quoteText: "This is a mock quote", quoteAuthor: "Mock Author")
        completion(.success(mockQuote))
    }
}

class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    
    // makes an API call to retrieve a random quote
    func fetchQuote(from url: URL, completion: @escaping (Result<Quote, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                print("No data received")
                completion(.failure(error))
                return
            }
            do {
                let quote = try JSONDecoder().decode(Quote.self, from: data)
                completion(.success(quote))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
