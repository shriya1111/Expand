//
//  ProfileView.swift
//  Look
//
//  Created by Shriya Edukulla on 7/19/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(width: 75, height: 75)
                            .foregroundColor(.white)
                            .background(Color(.systemGray))
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .fontWeight(.semibold)
                                .padding(.top, 2)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    
                }
                
                Section("General") {
                    HStack {
                        SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Section("Account") {
                    Button {
                        print("Sign out...")
                        viewModel.signOut()
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    }
                    
                    Button {
                        print("Delete Account...")
                    } label: {
                        SettingRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    }
                }
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
