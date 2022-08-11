//
//  PhoneViewModel.swift
//  PhoneAuth
//
//  Created by admin on 09.08.2022.
//

import SwiftUI
import Firebase
import FirebaseAuth
class PhoneViewModel: ObservableObject {

    @Published var phone = ""
    @Published var code = ""
    @Published var showAlert = false
    @Published var alertMGS = ""
    @StateObject var  viewModel = CodeViewModel()
    
    func sendOpt() {
        PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) { verificationId, err in
            
                if let error = err {
                    self.handleError(error: error)
                }
            else if let id = verificationId {
                self.navigationOTPView(id: id)

            }
        }
    }
    
    func navigationOTPView(id: String) {
        
        let alert = UIAlertController(title: "Verify phone", message: "Enter OTP", preferredStyle: .alert)
        alert.addTextField {txt in
            txt.placeholder = "123456"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Verify", style: .default, handler: { _ in
            if let otp = alert.textFields?[0].text{
                self.viewModel.verifyOTP(id: id, code: otp)
            }
        }))
    }
    
    func handleError(error:Error?) {
        if let error = error {
            alertMGS = error.localizedDescription
            showAlert.toggle()
            return
        }
    }
    
}

