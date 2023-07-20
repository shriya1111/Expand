//
//  LookApp.swift
//  Look
//
//  Created by Shriya Edukulla on 7/10/23.
//

import SwiftUI
import FirebaseCore
import Firebase

//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}

@main
struct LookApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
             ContentView()
                .environmentObject(viewModel)
            // signup()
            // LoginView()
        }
    }
}
