//
//  Login.swift
//  FireBasePhoneAuth
//
//  Created by admin on 04.08.2022.
//

import SwiftUI

struct Login: View {
    @StateObject var loginData = LoginViewModel()
    var body: some View {
        VStack {
            VStack {
                Text("Continue With Phone")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text("You receive a 4 digit code \n to verify next.")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
                //Mobil Number
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Enter Your Number")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("+ \(loginData.getCountryCode()) \(loginData.phone)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        Text("Continue")
                            .foregroundColor(.black)
                            .padding(.vertical,18)
                            .padding(.horizontal,38)
                            .background(Color.yellow.opacity(0.4))
                            .cornerRadius(15)
                    }
                }
                    .padding()
                    .background(Color.red)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)

            }
            .frame( height: UIScreen.main.bounds.height / 1.8)
            .background(Color.white)
            .cornerRadius(20)
            
            // Custom number pad
            GeometryReader {reader in
                VStack {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible() ,spacing: 20), count: 3),spacing: 15) {
                        ForEach(row,id: \.self) { value in
                            Button(action: {}) {
                                Text(value)
                                
//                                    .frame(
//                                        width: getWidth(frame: reader.frame(in: .global)),
//                                        height: getheight(frame: reader.frame(in: .global)))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        Color.red.opacity(0.1).ignoresSafeArea( edges: .bottom)
    }
    func getWidth(frame:CGRect)->CGFloat {
        let width = frame.width
        let actualWidth = width - 40

        return actualWidth / 3
    }

    func getheight(frame:CGRect)->CGFloat {
        let height = frame.height
        let actualheight = height - 30

        return actualheight / 4
    }

}

//Number Data

var row = ["1","2","3","4","5","6","7","8","9","","0","delete.left"]
//GeometryReader{ reader in
//    VStack {
//        LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 20), count: 3),spacing: 15) {
//            ForEach(row,id: \.self) {value in
//                Button(action: {buttonAction(value: value)}) {
//                    ZStack {
//                        if value == "delete.left" {
//                     Image(systemName: value)
//                                .font(.title2)
//                                .foregroundColor(.black)
//
//                        }
//                        else {
//                            Text(value)
//                                .font(.title2)
//                                .fontWeight(.bold)
//                                .foregroundColor(Color.black)
//                        }
//                    }
//                    .frame(width: 40, height: 30)
//                    .background(Color.red)
//                        .cornerRadius(10)
//                }
//                .disabled(value == "" ? true : false)
//            }
//        }
//    }
//    .padding()
//
//}
// getting height and width for dynamic sizing

//чомусь не працює

//func buttonAction(value: String) {
//
//    if  value == "delete.left" && loginData.phone != "" {
//        loginData.phone.removeLast()
//    }
//    if value != "delete.left" {
//        loginData.phone.append(value)
//    }
//}
