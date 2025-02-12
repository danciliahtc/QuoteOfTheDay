//
//  LoginViewModel.swift
//  QuoteOfTheDay
//
//  Created by Dancilia Harmon   on 2/10/25.
//  LoginViewModel - manages the logic where users can input their email and password to either login or sign up

import SwiftUI
import FirebaseAuth

@MainActor
class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated = false
    @Published var errorMessage: String?
    
    private var authService: AuthenticationService
    
    init(authService: AuthenticationService = AuthService.shared) {
        self.authService = authService
    }
    
    // calls AuthService to authenticate the user
    func signIn() async {
        print("Attempting to sign in with email: \(email)")
        do {
            let user = try await authService.signIn(email: email, password: password)
            isAuthenticated = true
            print("Signed in as \(user.email ?? "Unknown Email")")
        } catch {
            errorMessage = error.localizedDescription
            print("Sign-in error: \(error.localizedDescription)")
        } // segregate authservice in a different file, and call a dependency and then make it testable
    }
    
    // creates a new user in Firebase
    func signUp() async {
        print("Attempting to sign up with email: \(email)")
        do {
            let user = try await authService.signUp(email: email, password: password)
            isAuthenticated = true
            print("Signed in as \(user.email ?? "Unknown Email")")
          } catch {
              errorMessage = error.localizedDescription
              print("Sign-up error: \(error.localizedDescription)")
        }
    }
                  
    func signOut() async {
        do {
            try await authService.signOut()
            isAuthenticated = false
            email = ""
            password = ""
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
