//
//  ContentView.swift
//  FireBasePractice
//
//  Created by admin on 27.07.2022.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var message = ""
    @State var phone = ""
    @State var alert = false
    @State var show = false
    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                TextField("Login", text: $email)
                    .frame(height: 50)
                    .padding([.trailing,.leading],50 )
                    .background(Color.blue.opacity(0.3))
                    .cornerRadius(.infinity)
                TextField("Password", text: $password)
                    .frame( height: 50)
                    .padding([.trailing,.leading],50 )
                    .background(Color.green.opacity(0.3))
                    .cornerRadius(.infinity)
                TextField("Phone", text: $phone)
                    .frame( height: 50)
                    .padding([.trailing,.leading],50 )
                    .background(Color.green.opacity(0.3))
                    .cornerRadius(.infinity)
                Button(action: {
                    singInWthEmail(email: self.email, pasword: self.password) { verified, status in
                        if !verified {
                            self.alert.toggle()
                        }
                        else {
                            UserDefaults.standard.set(true, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                        }
                    }
                    
                }) {
                    Text("Check")
                        .frame(width: 100 ,height: 50)
                        .background(Color.red.opacity(0.3))
                        .cornerRadius(.infinity)
                        .padding([.trailing,.leading],50)
                }
                Button(action: {
                    singUpWithEmail(email: self.email, pasword: self.password, phone: self.phone) { verifed, status in
                        if !verifed {
                            self.message = status
                            self.alert.toggle()
                        }
                        else {
                            UserDefaults.standard.set(true, forKey: "status")
                            self.show.toggle()
                        }
                    }
                }) {
                    Text("Save")
                        .frame(width: 100 ,height: 50)
                        .background(Color.red.opacity(0.3))
                        .cornerRadius(.infinity)
                        .padding([.trailing,.leading],50)
                }
            }
        }
    }
    
    func singInWthEmail(email: String,pasword: String, complition: @escaping (Bool,String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pasword) {(result, error) in
            if error != nil {
                complition(false, (error?.localizedDescription)!)
                return
            }
            complition(true, (result?.user.email)!)
        }
    }
    
    func singUpWithEmail(email: String,pasword: String, phone: String, complition: @escaping (Bool,String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: pasword) { (result, error) in
            if error != nil {
                complition(false, (error?.localizedDescription)!)
                return
            }
            complition(true, (result?.user.email)!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
