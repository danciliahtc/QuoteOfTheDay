//
//  QuoteOfTheDayTests.swift
//  QuoteOfTheDayTests
//
//  Created by Dancilia Harmon   on 2/10/25.
//

import XCTest
import ViewInspector
@testable import QuoteOfTheDay

final class CoordinatorTests: XCTestCase {
    
    var coordinator: Coordinator!
    
    override func setUp() {
        super.setUp()
        coordinator = Coordinator()
    }
    
    override func tearDown() {
        coordinator = nil
        super.tearDown()
    }
    
    // Coordinator Tests
    
    // Test that the default state of the Coordinator is loginView
    func testInitialState() {
        XCTAssertEqual(coordinator.isAuthenticated, false)
        XCTAssertEqual(coordinator.path, [.loginView])  // The initial path should have loginView
    }
    
    // Test that push() correctly adds a new view to the path
    func testPush() {
        coordinator.push(.quoteView)

        XCTAssertEqual(coordinator.path, [.loginView, .quoteView])  // New view should be pushed onto the stack
    }
    
    // Test that the coordinator pushes quoteView onto the path
    func testPushQuoteView() {
        coordinator.push(.quoteView)
        XCTAssertEqual(coordinator.path.last, .quoteView)  // Check if quoteView was pushed onto the stack
    }
    
    // Test that the coordinator pops the last view from the path
    func testPopView() {
        coordinator.push(.quoteView)
        coordinator.pop()
        XCTAssertEqual(coordinator.path.last, .loginView)  // After popping, it should return to loginView
    }
    
    // Test if the coordinator correctly handles switching to the reviewView
    func testPushReviewView() {
        coordinator.push(.reviewView)
        XCTAssertEqual(coordinator.path.last, .reviewView)  // Ensure reviewView was pushed
    }
    
    // Test that showLoginView() correctly updates isAuthenticated and path
    func testShowLoginView() {
        coordinator.showLoginView()
        XCTAssertFalse(coordinator.isAuthenticated, "isAuthenticated should be false")
        XCTAssertEqual(coordinator.path, [.loginView], "path should contain .loginView")
    }
    
    func testShowQuoteView() {
        coordinator.showQuoteView()
        XCTAssertTrue(coordinator.isAuthenticated, "isAuthenticated should be true")
        XCTAssertEqual(coordinator.path, [.quoteView], "path should contain .quoteView")
    }
    
    // Test that showReviewView() correctly updates isAuthenticated and path
    func testShowReviewView() {
        coordinator.showReviewView()
        XCTAssertTrue(coordinator.isAuthenticated, "isAuthenticated should be true")
        XCTAssertTrue(coordinator.path.contains(.reviewView), "path should contain .reviewView")
    }
}


