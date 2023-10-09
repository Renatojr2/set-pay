   //
   //  HomeView.swift
   //  set-pay
   //
   //  Created by Renato Junior on 20/09/23.
   //

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift




struct LoginView: View {
   @StateObject private var viewModel =  FirebaseViewModel()
   @State private var isLogged = false
   
   
   
   
   var body: some View {
      NavigationStack {
         VStack{
            Spacer()
            Image("saveMoney")
            
            Text("SetBy")
               .foregroundStyle(.linearGradient(colors: [Contantes.grayColor, Contantes.purpleColor], startPoint: .leading, endPoint: .trailing))
               .font(.system(size: 40))
               .padding(.bottom, 30)
            
            
            
            Text("Aprenda a poupar de uma forma inteligente.").font(.system(size: 30))
               .multilineTextAlignment(.center)
               .padding(.horizontal, 20)
            Spacer()
            
            
            Button(action: {
               viewModel.signIn { success in
                  if success {
                     isLogged = viewModel.isLoggedIn
                     
                  }
                  
                  
               }
               
            }, label:{
               
               if viewModel.isLoading {
                  ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white)) 
                    
                  
               } else {
                  
                  Text("Entrar com conta google")
                     .foregroundColor(.white)
               }
               
            }).disabled(viewModel.isLoading)
               .frame(width: 242, height: 47)
               .background(Color(hex: "#613EEA"))
               .cornerRadius(6)
               .shadow(color: Color(hex:"#613EEA")
                  .opacity(0.32), radius: 10, x: 0, y: 8)
            
            
         }
         
         .navigationDestination(isPresented: $isLogged , destination: {
            InformBalanceView(viewModel: viewModel)
               .navigationBarBackButtonHidden(true)
         })
         
      }
   }
}



#Preview {
   LoginView()
}
