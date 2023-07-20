//
//  LoginView.swift
//  Look
//
//  Created by Shriya Edukulla on 7/19/23.
//

import SwiftUI

//struct ContentView: View {
//    @EnvironmentObject var viewModel: AuthViewModel
//    var body: some View {
//        NavigationView {
//            LoginView()
//        }
//    }
//}

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                // form fields
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                Button(action: {
                    Task {
                        try await viewModel.signIn(withEmail:email, password: password)
                    }
                    
                    print("Log user in...")
                }) {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(24)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                
                Spacer()
                
                // sign up button
                NavigationLink {
                    RegistrationView()
    //                    .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 5) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                    .foregroundColor(Color(.systemBlue))
                }
            }
        }
        
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {

                LoginView()

    }
}
