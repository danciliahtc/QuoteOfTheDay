//
//  ReviewViewModel.swift
//  QuoteOfTheDay
//
//  Created by Dancilia Harmon   on 2/09/25.
//  ReviewViewModel handles submitting the review to Firestore

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ReviewViewModel: ObservableObject {
    @Published var user: UserModel? = UserModel.current
    @Published var reviewText: String = ""
    @Published var isSubmitting: Bool = false
    @Published var successMessage: String?
    @Published var errorMessage: String?
    
    // sends the review to Firestore and displays feedback indicators (loading, success, or error)
    func submitReview() {
        guard !reviewText.isEmpty else {
            errorMessage = "Please enter a review before submitting."
            return
        }
        
        isSubmitting = true
        let db = Firestore.firestore()
        
        // Save the review to Firestore
        db.collection("reviews").addDocument(data: [
            "reviewText": reviewText,
            "timestamp": Timestamp(),
            "userEmail": Auth.auth().currentUser?.email ?? "Anonymous"
        ]) { error in
            DispatchQueue.main.async {
                self.isSubmitting = false
                if let error = error {
                    self.errorMessage = "Error submitting review: \(error.localizedDescription)"
                } else {
                    self.successMessage = "Thank you for your review!"
                    self.reviewText = ""  // Clear the text field
                }
            }
        }
    }
    
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
