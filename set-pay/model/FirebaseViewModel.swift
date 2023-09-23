//
//  FirebaseViewModel.swift
//  set-pay
//
//  Created by Renato Junior on 20/09/23.
//

import SwiftUI
import GoogleSignIn

class FirebaseViewModel: ObservableObject {
  
  @Published var givenName: String = ""
  @Published var profilePicUrl: String = ""
  @Published var isLoggedIn: Bool = false
  @Published var isLoading: Bool = false
  @Published var errorMessage: String = ""
  
  init(){
    check()
  }
  
  func checkStatus(){
    if(GIDSignIn.sharedInstance.currentUser != nil){
      let user = GIDSignIn.sharedInstance.currentUser
      guard let user = user else { return }
      let givenName = user.profile?.givenName
      let profilePicUrl = user.profile!.imageURL(withDimension: 100)!.absoluteString
      self.givenName = givenName ?? ""
      self.profilePicUrl = profilePicUrl
      self.isLoggedIn = true
    }else{
      self.isLoggedIn = false
      self.givenName = "Not Logged In"
      self.profilePicUrl =  ""
    }
  }
  
  func check(){
    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
      if let error = error {
        self.errorMessage = "error: \(error.localizedDescription)"
      }
      
      self.checkStatus()
    }
  }
  
  func signIn(completion: @escaping (Bool) -> Void){
    self.isLoading = true
    guard let presentingViewController = (UIApplication.shared.connectedScenes.first
                                          as? UIWindowScene)?.windows.first?.rootViewController
    else {return}
    
    let signInConfig = GIDConfiguration.init(clientID: "CLIENT-ID")
    GIDSignIn.sharedInstance.signIn(
      withPresenting: presentingViewController) { signInResult, error in
        guard let result = signInResult else {
          self.isLoading = false
          completion(false)
          return
        }
        self.isLoading = false
        completion(true)
        self.checkStatus()
        
      }
    
  }
  
  func signOut(){
    GIDSignIn.sharedInstance.signOut()
    self.checkStatus()
  }
}
