////
////  AuthServiceTests.swift
////  QuoteOfTheDayTests
////
////  Created by Dancilia Harmon   on 2/11/25.
////
//
//import XCTest
//@testable import QuoteOfTheDay
//import FirebaseAuth
//
//final class AuthServiceTests: XCTestCase {
//    var authService: AuthService!
//
//    override func setUp() {
//        super.setUp()
//        authService = MockAuthService()
//    }
//
//    override func tearDown() {
//        authService = nil
//        super.tearDown()
//    }
//    
//    func testSignInSuccess() async {
//        do {
//            let user = try await authService.signIn(email: "test@example.com", password: "password")
//            XCTAssertEqual(user.email, "test@example.com")
//        } catch {
//            XCTFail("SignIn failed with error: \(error.localizedDescription)")
//        }
//    }
//    
//    func testSignInFailure() async {
//        let mockAuthService = MockAuthService()
//        mockAuthService.shouldReturnError = true
//        
//        do {
//            _ = try await mockAuthService.signIn(email: "wrong@example.com", password: "wrongpassword")
//            XCTFail("SignIn should have failed")
//        } catch let error as NSError {
//            XCTAssertEqual(error.localizedDescription, "Invalid credentials")
//        }
//    }
//}
