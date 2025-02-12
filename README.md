# **Quote of the Day** App

**Quote of the Day** is an iOS app that delivers a new inspirational quote every day. The app provides users with a seamless experience for signing up, logging in, viewing quotes, and leaving reviews. It integrates Firebase Authentication for managing user authentication and stores quotes fetched from a public API.

---

## **Project Overview**

This app aims to provide a daily dose of motivation to users. Users can sign up, log in, and view a new quote each day. They can also leave a review for the quotes they see, share their thoughts on the app, and manage their authentication states through Firebase.

### **Features:**
- User Authentication (Sign Up, Sign In, Sign Out)
- Daily Quote Display
- Leave Reviews on Quotes
- Simple and modern user interface
- Firebase Authentication integration
- SwiftUI-based UI

---

## **Architecture**

The app follows the **MVVM (Model-View-ViewModel)** architecture, where:
- **Model**: Contains the business logic (user data, quote data).
- **View**: Displays the UI components.
- **ViewModel**: Manages the data flow between the View and Model, containing logic to fetch quotes and handle authentication.

In addition to MVVM, the **Coordinator** pattern is used for handling navigation, making it easier to manage view transitions and separating concerns related to navigation logic.

---

## **Technologies Used**

- **Swift 5**: The primary programming language.
- **SwiftUI**: The UI framework used to build the user interface.
- **Firebase**:
  - **Firebase Authentication**: For managing user sign-up, sign-in, and sign-out.
  - **Firestore**: To store reviews submitted by users.
- **ViewInspector**: A framework used for unit testing SwiftUI views.
- **URLSession**: For making network requests to fetch quotes from the API.

---

## **Frameworks Used**

- **FirebaseAuth**: Used for user authentication (sign-in, sign-up, sign-out).
- **FirebaseFirestore**: To store and retrieve data, such as user reviews.
- **Combine**: To handle asynchronous data streams and manage state.
- **SwiftUI**: For building the app’s UI.
- **ViewInspector**: To inspect and test SwiftUI views in unit tests.
  
---

## **App Flow**

1. **Authentication**:
   - User signs up or logs in using their email and password.
   - Upon successful login, the user is directed to the **QuoteView**.
   - The user can sign out at any time, which will redirect them back to the **LoginView**.

2. **Quote Display**:
   - Once authenticated, the user sees a daily quote on the **QuoteView**.
   - The quote is fetched from the **Forismatic API**.
   - The user can click a button to fetch a new quote.

3. **Review Feature**:
   - Users can leave a review about the quote they see.
   - Reviews are stored in **Firebase Firestore**.
   
---

## **App Structure**

### **Coordinator Pattern**
The **Coordinator** manages the navigation stack and handles transitions between the views. It keeps the navigation logic separated from the views themselves.

- **Coordinator.swift**: The central point of navigation control.
- **CoordinatorView.swift**: A view that listens for navigation changes and updates the displayed view accordingly.

### **Model Layer**
Contains the core data models and services that interact with Firebase.

- **AuthService.swift**: Manages the logic for user authentication using Firebase.
- **UserModel.swift**: Represents the current user in a simplified structure.
- **QuoteModel.swift**: Represents the quote data fetched from the API.

### **View Layer**
Contains all the SwiftUI views for the user interface.

- **LoginView.swift**: UI for user sign-up and login.
- **QuoteView.swift**: Displays the daily quote and provides functionality for fetching a new one.
- **ReviewView.swift**: Allows users to leave a review for the quote they just saw.
  
---

## **Unit Testing**

- **Test Cases**: The app includes unit tests for the **AuthService**, **LoginViewModel**, and **Coordinator**.
- **Mocking**: For unit testing purposes, **MockAuthService** is used to simulate Firebase authentication behavior, ensuring tests are isolated from external services.
  
---

## **How to Run the App**

### Prerequisites:
1. Xcode 12 or later.
2. CocoaPods installed (if using Pods).
3. A Firebase project set up with **Firebase Authentication** and **Firestore** enabled.

### Steps to Run:
1. Clone this repository.
2. Open the `.xcodeproj` file in Xcode.
3. Install dependencies by running `pod install` (if using CocoaPods).
4. Set up Firebase in your app and add your `GoogleService-Info.plist` file.
5. Build and run the project.

---

## **Future Improvements**
- Add more detailed user profiles.
- Provide an option to save favorite quotes.
- Add push notifications to remind users to check the daily quote.

---

## **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
