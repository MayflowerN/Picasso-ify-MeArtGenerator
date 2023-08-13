//
//  LoginView.swift
//  Art Generator
//
//  Created by Ellie on 7/6/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var showforgotPassword: Bool = false
    @State private var showDALLEImagesView: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Welcome Back")
                    .font(Font.custom("Poppins", size: 32).weight(.bold))
                    .foregroundColor(.black)
                    .padding()

                Group {
                    inputField(imageName: "Email", placeholder: "Enter Your Email", text: $email)
                    Spacer().frame(height: 20)
                    inputField(imageName: "Lock", placeholder: "Enter Your Password", text: $password)
                }.padding(.horizontal)

                HStack {
                    Spacer()

                    Button(action: {
                        showforgotPassword = true
                    }) {
                        Text("Forgot Password")
                            .font(Font.custom("Poppins", size: 12))
                            .kerning(0.06)
                            .foregroundColor(Color(red: 1, green: 0.08, blue: 0.41))
                    }
                    .fullScreenCover(isPresented: $showforgotPassword) {
                        ForgotPassword()
                    }
                }.padding()

                Button(action: {
                    Auth.auth().signIn(withEmail: email, password: password) { result, error in
                        if let error = error {
                            print("Login failed: \(error.localizedDescription)")
                        } else {
                            showDALLEImagesView = true
                        }
                    }
                }) {
                    Text("Login")
                        .font(Font.custom("Poppins-Black", size: 20).weight(.semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 20)
                        .background(Color(red: 1, green: 0.08, blue: 0.41))
                        .cornerRadius(15)
                }
                .fullScreenCover(isPresented: $showDALLEImagesView) {
                    DALLEImagesView()
                }
                .padding()
                
                Spacer()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func inputField(imageName: String, placeholder: String, text: Binding<String>) -> some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)

            TextField(placeholder, text: text)
                .font(Font.custom("Poppins", size: 12))
                .kerning(0.06)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
