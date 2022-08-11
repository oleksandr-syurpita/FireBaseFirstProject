//
//  PhoneView.swift
//  PhoneAuth
//
//  Created by admin on 09.08.2022.
//

import SwiftUI

struct PhoneView: View {
    @StateObject var viewModel = PhoneViewModel()
    @State var status = false
    var body: some View {
        NavigationView {
            VStack(spacing: 100) {
                Text("Phone Auth")
                    .bold()
                
                TextField("",text: $viewModel.phone)
                    .keyboardType(.numberPad)
                    .frame(width: 200, height: 50, alignment: .center)
                    .background(Color.blue.opacity(0.3))
                    .foregroundColor(Color.white)
                
                Button(action: {self.status = true }) {
                Text("code")
                }
                NavigationLink(
                            destination:
                                CodeView(viewModel: PhoneViewModel())
                                    .navigationBarBackButtonHidden(status),
                            isActive: $status) {}
            }

        }
    }
}

struct PhoneView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneView()
    }
}
