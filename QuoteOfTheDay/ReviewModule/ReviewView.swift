//
//  ReviewView.swift
//  QuoteOfTheDay
//
//  Created by Dancilia Harmon   on 2/10/25.
//  ReviewView allows users to leave a  review about the quote or the app

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct ReviewView: View {
    @StateObject private var reviewViewModel = ReviewViewModel()
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var quoteViewModel = QuoteViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text(quoteViewModel.user?.email ?? "Unknown User")
                    .font(.headline)
                Spacer()
                
                // Settings Dropdown
                Menu {
                    Button(role: .destructive, action: {
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
                    Button(action: {
                        // Navigate to Quote Page
                        coordinator.pop()
                    }) {
                        Label("Quote of the Day", systemImage: "home.fill")
                    }
                } label: {
                    Image(systemName: "gear")
                        .font(.title2)
                        .padding(.trailing)
                }
            }
            .padding([.horizontal, .top])
            
            Text("Leave Us a Review")
                .font(.largeTitle)
                .padding()
            
            TextField("Enter your review...", text: $reviewViewModel.reviewText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(height: 150)  // Adjust height for multiline input
            
            Button(action: {
                reviewViewModel.submitReview()
                print("Review submitted: \(reviewViewModel.reviewText)")
            }) {
                Text("Submit Review")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
            
            if reviewViewModel.isSubmitting {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            
            if let successMessage = reviewViewModel.successMessage {
                Text(successMessage)
                    .foregroundColor(.green)
            }
            
            if let errorMessage = reviewViewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            
            Spacer()
        }
        .padding()
    }
}
   
