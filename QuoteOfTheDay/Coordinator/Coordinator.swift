//
//  Coordinator.swift
//  QuoteOfTheDay
//
//  Created by Dancilia Harmon   on 2/10/25.
//  Coordinator manages the navigation flow of the app, controlling which screen(view) is displayed.

import SwiftUI
import FirebaseAuth

enum AppView: Hashable {
    case loginView
    case quoteView
    case reviewView
}

final class Coordinator: ObservableObject {
    static let shared = Coordinator()
    @Published var isAuthenticated: Bool = false
    @Published var path: [AppView] = [.loginView]
    
    func push(_ appView: AppView) { // adds a new view to the navigation stack
        path.append(appView)
    }
    
    func pop() { // removes the last view from the navigation stack
        path.removeLast()
    }
    
    func showQuoteView() { // displays the QuoteView (after login)
        isAuthenticated = true
        path = [.quoteView]
    }
    
    func showLoginView() { // Displays the LoginView (when not authenticated)
        isAuthenticated = false
        path = [.loginView]
    }
    
    func showReviewView() { // Displays the ReviewView when the user wants to leave a review
        isAuthenticated = true
        path = [.reviewView]
    }
    
    @ViewBuilder
    func build(_ appView: AppView) -> some View {
        switch appView {
        case .loginView:
            LoginView()
        case .quoteView:
            QuoteView()
        case .reviewView:
            ReviewView()
        }
    }
}

// using a path array "[AppView]" to manage navigation state. it makes it easy to push and pop views based on the user's actions
