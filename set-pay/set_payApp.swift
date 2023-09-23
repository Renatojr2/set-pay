//
//  set_payApp.swift
//  set-pay
//
//  Created by Renato Junior on 20/09/23.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

extension set_payApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}

@main
struct set_payApp: App {
  init(){
    setupAuthentication()
  }
    var body: some Scene {
        WindowGroup {
            ContentView()
            .onOpenURL(perform: { url in
              GIDSignIn.sharedInstance.handle(url)
            })
            .preferredColorScheme(.light)
        }
    }
}
