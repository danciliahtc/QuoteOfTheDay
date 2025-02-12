////
////  MockAuthService.swift
////  QuoteOfTheDayTests
////
////  Created by Dancilia Harmon   on 2/11/25.
////
//
//import XCTest
//@testable import QuoteOfTheDay
//import FirebaseAuth
//
//struct MockUser: User {
//    var uid: String
//    var email: String
//    var displayName: String?
//    var photoURL: URL?
//    var providerID: String
//    var isAnonymous: Bool
//    var metadata: UserMetadata
//    var providerData: [UserInfo]
//    
//    init(uid: String, email: String?) {
//        self.uid = uid
//        self.email = email
//        self.displayName = nil
//        self.photoURL = nil
//        self.providerID = "mockProvider"
//        self.isAnonymous = false
//        self.metadata = UserMetadata()
//        self.providerData = []
//    }
//    
//    func getIDToken() async throws -> String {
//        return "mockToken"
//    }
//
//    func getIDTokenResult(forcingRefresh: Bool) async throws -> AuthTokenResult {
//        return AuthTokenResult(token: "mockToken", expirationDate: Date())
//    }
//}
//
//class MockAuthenticationService: AuthenticationService {
//    var shouldReturnError = false
//    
//    // Mock success for signIn
//    func signIn(email: String, password: String) async throws -> User {
//        if shouldReturnError {
//            throw NSError(domain: "AuthError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"])
//        }
//        return MockUser(uid: "12345", email: email) // Mock user response
//    }
//    
//    // Mock signUp
//    func signUp(email: String, password: String) async throws -> User {
//        if shouldReturnError {
//            throw NSError(domain: "AuthError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"])
//        }
//        return MockUser(uid: "12345", email: email) // Mock user response
//    }
//    
//    // Mock signOut
//    func signOut() async throws {
//        // Simulate successful sign out
//    }
//    
//    func getCurrentUser() -> User? {
//        return MockUser(uid: "12345", email: "test@example.com")
//    }
//}
