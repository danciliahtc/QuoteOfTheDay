//
//  CoordinatorView.swift
//  QuoteOfTheDay
//
//  Created by Dancilia Harmon   on 2/10/25.
//  CoordinatorView listens for changes in the navigation state (path) from the Coordinator and updates the UI to reflect the correct view (login ,quote, or review)

import SwiftUI

struct CoordinatorView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        Group {
            switch coordinator.path.last { // based on the last element in coordinator.path, it shows either quoteview, loginview, or reviewview
            case .quoteView:
                QuoteView()
            case .reviewView:
                ReviewView()  // Navigate to ReviewView
            case .loginView:
                LoginView()
            default:
                LoginView()
            }
        }
        .onChange(of: coordinator.path) { newPath in
            // listens for changes to the path array and updates accordingly
            if newPath.isEmpty {
                coordinator.push(.loginView)  // Default view when stack is empty
            }
        }
    }
}

