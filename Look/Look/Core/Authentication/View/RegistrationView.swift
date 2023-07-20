//
//  RegistrationView.swift
//  Look
//
//  Created by Shriya Edukulla on 7/19/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                    .autocapitalization(.none)
                
                InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name")
                
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
                
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            // sign up button
            Button {
                Task {
                    try await viewModel.createUser(withEmail:email, password: password, fullname: fullname)
                }
                print("Sign user up...")
            } label: {
                HStack {
                    Text("SIGN UP")
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
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 5) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
                .foregroundColor(Color(.systemBlue))
            }
        }
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && !fullname.isEmpty
        && confirmPassword == password
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
