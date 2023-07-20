//import Foundation
////
////  ContentView.swift
////  Look
////
////  Created by Shriya Edukulla on 7/10/23.
////
//
//import SwiftUI
//import FirebaseAnalyticsSwift
//
//struct signup: View {
//    @State private var username = ""
//    @State private var password = ""
//    @State private var showingSignUpScreen = false
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color.green
//                    .ignoresSafeArea()
//                Rectangle()
//                    .foregroundColor(.white)
//                    .frame(width: 500, height: 300)
//                VStack {
//                    Text("SignUp")
//                        .font(.largeTitle)
//                        .bold()
//                        .padding()
//                    TextField("Username", text: $username)
//                        .padding()
//                        .frame(width: 300, height: 50)
//                        .background(Color.black.opacity(0.05))
//                        .cornerRadius(10)
//                    SecureField("Password", text: $password)
//                        .padding()
//                        .frame(width: 300, height: 50)
//                        .background(Color.black.opacity(0.05))
//                        .cornerRadius(10)
//
//                    Button(action: {
//                        // Store info in database
//                        buttonClicked()
//                    }) {
//                        Text("SignUp")
//                            .foregroundColor(.white)
//                            .frame(width: 300, height: 50)
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }
//
//
//                    NavigationLink(destination: Text("You are signed in as @\(username)"), isActive: $showingSignUpScreen) {
//                        EmptyView()
//                    }
//
//                }
//            }
//            .navigationBarHidden(true)
//        }
//        .analyticsScreen(name: "\(signup.self)")
//    }
//    func buttonClicked() {
//        showingSignUpScreen = true;
//    }
//
//}
//
//struct signup_Previews: PreviewProvider {
//    static var previews: some View {
//        signup()
//    }
//}
