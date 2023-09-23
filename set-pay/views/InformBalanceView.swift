//
//  InformBalanceView.swift
//  set-pay
//
//  Created by Renato Junior on 21/09/23.
//

import SwiftUI

struct InformBalanceView: View {
  @StateObject private var viewModel: FirebaseViewModel
  
  init(viewModel: FirebaseViewModel) { // Remova 'private'
    self._viewModel = StateObject(wrappedValue: viewModel)
  }
    var body: some View {
      Text("Seja bem vindo \(viewModel.givenName)")
    }
}

#Preview {
    InformBalanceView(viewModel: FirebaseViewModel())
}
