////
////  MockLoginViewModel.swift
////  QuoteOfTheDayTests
////
////  Created by Dancilia Harmon   on 2/11/25.
////
//
//import XCTest
//@testable import QuoteOfTheDay
//import FirebaseAuth
//
//class MockLoginViewModel: LoginViewModel {
//    override init() {
//        super.init()
//    }
//    
//    override func signIn() async {
//        do {
//            let user = try await AuthService.shared.signIn(email: "test@example.com", password: "password")
//            isAuthenticated = true
//        } catch {
//            errorMessage = error.localizedDescription
//        }
//    }
//}
