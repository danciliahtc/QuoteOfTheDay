////
////  LoginViewModelTests.swift
////  QuoteOfTheDayTests
////
////  Created by Dancilia Harmon   on 2/11/25.
////
//
//import XCTest
//@testable import QuoteOfTheDay
//import FirebaseAuth
//
//final class LoginViewModeTests: XCTestCase {
//    var loginViewModel: LoginViewModel!
//    var mockAuthService: MockAuthenticationService!
//    
//    override func setUp() {
//        super.setUp()
//        mockAuthService = MockAuthenticationService()
//        loginViewModel = LoginViewModel(authService: mockAuthService)
//    }
//    
//    override func tearDown() {
//        loginViewModel = nil
//        mockAuthService = nil
//        super.tearDown()
//    }
//    
//    func testLoginSuccess() async {
//        mockAuthService.shouldReturnError = false
//        await LoginViewModel.signIn()
//        XCTAssertTrue(loginViewModel.isAuthenticated)
//        XCTAssertNil(loginViewModel.errorMessage)
//    }
//    
//    func testLoginFailure() async {
//        mockAuthService = MockAuthService()
//        mockAuthService.shouldReturnError = true
//        await loginViewModel.signIn()
//        
//        XCTAssertFalse(loginViewModel.isAuthenticated)
//        XCTAssertEqual(loginViewModel.errorMessage, "Invalid credentials")
//    }
//    
//    func testSignUpFailure() async {
//        // Simulate sign-up failure
//        mockAuthService.shouldReturnError = true
//
//        await loginViewModel.signUp()
//
//        XCTAssertFalse(loginViewModel.isAuthenticated)
//        XCTAssertEqual(loginViewModel.errorMessage, "Invalid credentials")
//    }
//
//    func testSignOut() async {
//        // Simulate sign-in first
//        mockAuthService.shouldReturnError = false
//        await loginViewModel.signIn()
//
//        // Sign out
//        await loginViewModel.signOut()
//
//        XCTAssertFalse(loginViewModel.isAuthenticated)
//        XCTAssertEqual(loginViewModel.email, "")
//        XCTAssertEqual(loginViewModel.password, "")
//    }
//}
