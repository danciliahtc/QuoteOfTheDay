//
//  QuoteOfTheDayApp.swift
//  QuoteOfTheDay
//
//  Created by Dancilia Harmon   on 2/10/25.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct QuoteOfTheDayApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var coordinator = Coordinator()

    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .environmentObject(coordinator)
        }
    }
}
