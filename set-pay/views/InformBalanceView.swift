   //
   //  InformBalanceView.swift
   //  set-pay
   //
   //  Created by Renato Junior on 21/09/23.
   //

import SwiftUI


struct InformBalanceView: View {
   @StateObject private var viewModel: FirebaseViewModel
   @State private var money = ""
   
   init(viewModel: FirebaseViewModel) { // Remova 'private'
      self._viewModel = StateObject(wrappedValue: viewModel)
   }
   
   
   private let moneyFormatter: NumberFormatter = {
      let formatter = NumberFormatter()
      formatter.numberStyle = .currency
      formatter.currencySymbol = "R$"
      return formatter
   }()
   
   
   
   
   var body: some View {
      VStack {
         Spacer()
         Image("wallet")
            .padding(.bottom, 5)
         HStack {
            Text("Seja bem vindo")
            Text(viewModel.givenName).fontWeight(.bold)
            
         }
            .padding(.bottom, 20)
         Text("Aqui começa sua jornada rumo a independência financeira.")
            .font(.title2)
            .multilineTextAlignment(.center)
         
         VStack {
            TextField("Informe o valor", value: $money, formatter: self.moneyFormatter)
               .keyboardType(.decimalPad)
               .onTapGesture {
                  if self.money == "0,00" { // Pode ajustar o valor inicial conforme necessário
                     self.money = ""
                  }
               }
               
            
            
            Rectangle()
               .frame(height: 1)
               .foregroundColor(Color(hex:"#613EEA"))
            
         }
         .padding(.horizontal, 40)
         .padding(.top, 14)
         
         
         Spacer()
         Button(action: {
            
            
         }, label:{
            
            
            Text("Continue")
               .foregroundColor(.white)
            
         })
         .frame(width: 242, height: 47)
         .background(Color(hex: "#613EEA"))
         .cornerRadius(6)
         .shadow(color: Color(hex:"#613EEA")
            .opacity(0.32), radius: 10, x: 0, y: 8)
         
      }
      
   }
}

#Preview {
   InformBalanceView(viewModel: FirebaseViewModel())
}

