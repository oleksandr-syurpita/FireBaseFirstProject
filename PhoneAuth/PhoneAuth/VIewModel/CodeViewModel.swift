//
//  CodeViewModel.swift
//  PhoneAuth
//
//  Created by admin on 09.08.2022.
//

import SwiftUI
import Firebase
import FirebaseAuth

class CodeViewModel: ObservableObject {
    
    @StateObject var vieModel = PhoneViewModel()
    
    func verifyOTP(id: String,code: String) {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: id, verificationCode: code)
        Auth.auth().signIn(with: credential) { result, err in
                self.vieModel.handleError(error: err )
            
            self.vieModel.alertMGS = "Success"
            self.vieModel.showAlert.toggle()
        }
    }
}

