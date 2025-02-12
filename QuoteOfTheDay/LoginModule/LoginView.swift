//
//  LoginView.swift
//  QuoteOfTheDay
//
//  Created by Dancilia Harmon   on 2/10/25.
//  LoginView - UI where users can input their email and password to either login or sign up

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Text("Quote of the Day")
                .font(.largeTitle)
                .padding()
            Text("Your daily dose of wisdom")
                .font(.subheadline)
                .padding()
            
            // binding used here to bind email, password, and error messages from the LoginViewModel
            TextField("Email", text: $loginViewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
            
            SecureField("Password", text: $loginViewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                Task {
                    print("Login button tapped")
                    await loginViewModel.signIn()
                    
                    if loginViewModel.isAuthenticated {
                        print("Navigating to QuoteView")
                        coordinator.showQuoteView()
                    }
                }
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
                Task {
                    await loginViewModel.signUp()
                }
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
            
            if let errorMessage = loginViewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
}
