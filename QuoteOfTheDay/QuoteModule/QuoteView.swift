//
//  ContentView.swift
//  QuoteOfTheDay
//
//  Created by Dancilia Harmon   on 2/10/25.
//  QuoteView displays the quote of the day and allows users to refresh the quote or log out. 

import SwiftUI

struct QuoteView: View {
    @StateObject var quoteViewModel = QuoteViewModel()
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            HStack {
                // displays the email of the currently logged-in user
                Text(quoteViewModel.user?.email ?? "Unknown User")
                    .font(.headline)
                Spacer()
                
                // Settings Dropdown
                Menu {
                    Button(role: .destructive, action: {
                        // allows the user to logout, which updates the UI to show the login screen again
                        Task {
                            await quoteViewModel.logout(coordinator: coordinator)
                        }
                    }) {
                        Label("Logout", systemImage: "power")
                    }
                    Button(action: {
                        // Navigate to Review Page
                        coordinator.push(.reviewView)
                    }) {
                        Label("Leave a Review", systemImage: "star.fill")
                    }
                } label: {
                    Image(systemName: "gear")
                        .font(.title2)
                        .padding(.trailing)
                }
            }
            .padding([.horizontal, .top])
            
            Text("Quote of the Day")
                .font(.title)
                .padding()
            
            Spacer(minLength: 5)
            
            // Loading or displaying the quote
            if quoteViewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else if let quote = quoteViewModel.quote {
                Text("\"\(quote.quoteText)\"")
                    .font(.title)
                    .padding()
                
                Text("- \(quote.quoteAuthor ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()
                
                Button(action: {
                    quoteViewModel.fetchQuote()
                }) {
                    Text("Get New Quote")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            } else {
                Text("Press the button to get a quote")
                    .padding()
                
                Button(action: {
                    quoteViewModel.fetchQuote()
                }) {
                    Text("Get Quote")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            Spacer()
        }
        .onAppear {
            quoteViewModel.fetchQuote()
        }
    }
}

#Preview {
    QuoteView()
}
