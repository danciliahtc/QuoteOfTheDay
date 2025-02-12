//
//  AuthService.swift
//  QuoteOfTheDay
//
//  Created by Dancilia Harmon   on 2/10/25.
//  AuthService abstracts the logic for Firebase Authentication. (Signing up, signing out, and fetching the current user)

import SwiftUI
import FirebaseAuth

// protocol that defines the authentication services
protocol AuthenticationService {
    func signIn(email: String, password: String) async throws -> User
    func signUp(email: String, password: String) async throws -> User
    func signOut() async throws
    func getCurrentUser() -> User?
    
}

class AuthService: AuthenticationService {
    static let shared = AuthService()
    
    private init() {}
    
    // Signs in the user with email and password.
    func signIn(email: String, password: String) async throws -> User {
        print("AuthService - Signing in user: \(email)")
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        print("AuthService - Signed in successfully")
        return result.user
    }
    
    // Registers a new user with email and password.
    func signUp(email: String, password: String) async throws -> User {
        print("AuthService - Signing up user: \(email)")
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        print("AuthService - Signed up successfully")
        return result.user
    }
    
    // Signs the user out.
    func signOut() async throws {
        do {
            try Auth.auth().signOut()
        } catch {
            throw error
        }
    }
    
    // Returns the current logged-in user if any.
    func getCurrentUser() -> User? {
        return Auth.auth().currentUser
    }
}

// AuthService is a signleton to make sure there's only 1 instance managing authentication across the app, which simplifies maintaining the user session and prevents unnecessary instantiations.
