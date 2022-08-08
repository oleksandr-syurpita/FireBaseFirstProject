//
//  LoginViewModel.swift
//  FireBasePhoneAuth
//
//  Created by admin on 04.08.2022.
//

import SwiftUI

class LoginViewModel: ObservableObject {
   
    @Published var phone = ""
    
    // getting coutry phone Code
    
    func getCountryCode()->String {
        let regionCode = Locale.current.regionCode ?? ""
        return country[regionCode] ?? ""
        
    }
}
