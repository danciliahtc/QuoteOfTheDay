////
////  LoginViewTests.swift
////  QuoteOfTheDayTests
////
////  Created by Dancilia Harmon   on 2/11/25.
////
//
//import XCTest
//import ViewInspector
//@testable import QuoteOfTheDay
//
//extension LoginView: @retroactive Inspectable {}
//
//final class LoginViewTests: XCTestCase {
//    var loginView: LoginView!
//    
//    override func setUp() {
//        super.setUp()
//        loginView = LoginView()
//    }
//
//    override func tearDown() {
//        loginView = nil
//        super.tearDown()
//    }
//    
//    func testLoginButton() throws {
//        let view = try loginView.inspect().find(button: "Login")
//        XCTAssertNotNil(view)
//    }
//    
//    func testErrorMessage() throws {
//        let viewModel = LoginViewModel()
//        viewModel.errorMessage = "Invalid Credentials"
//        
//        let loginView = LoginView()
//        loginView.viewModel = viewModel
//        
//        let errorMessage = try loginView.inspect().find(text: "Invalid credentials")
//        XCTAssertNotNil(errorMessage)
//    }
//
//}
