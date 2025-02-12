//
//  UserModel.swift
//  QuoteOfTheDay
//
//  Created by Dancilia Harmon   on 2/10/25.
//  UserModel - represents a user with id & email. Provides a simplified abstraction for accessing the current user's details

import SwiftUI
import FirebaseAuth

struct UserModel {
    var id: String
    var email: String
}

// current is a computed property that fetches the current logged-in user from Firebase
extension UserModel {
    static var current: UserModel? {
        guard let user = Auth.auth().currentUser else { return nil }
        return UserModel(id: user.uid, email: user.email ?? "No Email")
    }
}

// (currentUser: Synchronously gets the cached current user, or null if there is none.)
// UserModel is needed bc it's an abstraction layer that makes it easier to interact with user data within the app and ensures consistency in accessing user properties like email
