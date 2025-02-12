//
//  QuoteViewModel.swift
//  QuoteOfTheDay
//
//  Created by Dancilia Harmon   on 2/10/25.
//  QuoteViewModel fetches the quote and manages the state of the quote (loading, success, or error).

import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseAuth

class QuoteViewModel: ObservableObject {
    @Published var user: UserModel? = UserModel.current
    @Published var quote: Quote? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private var networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    // retrieves the quote from the Forismatic API
    func fetchQuote() {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en") else {
            self.errorMessage = "Invalid URL"
            self.isLoading = false
            return
        }
        
        // observes the quote data and updates the UI based on whether it's loading, has successfully loaded, or failed to load.
        networkManager.fetchQuote(from: url) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let quote):
                    self.quote = quote
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    } // mahesh: focus on writing test cases on both viewmodels
    
    // allows the user to logout, which updates the UI to show the login screen again
    func logout(coordinator: Coordinator) async {
        do {
            try await Auth.auth().signOut()
            await MainActor.run {
                user = nil
                coordinator.showLoginView()
            }
            print("User logged out")
        } catch {
            print("Error logging out: \(error.localizedDescription)")
        }
    }
}
