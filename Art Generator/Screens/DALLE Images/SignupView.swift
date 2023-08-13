//
//  SignupView.swift
//  Art Generator
//
//  Created by Ellie on 7/6/23.
//

import SwiftUI
import Firebase

struct SignupView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showOnboarding_3: Bool = false
    
    @State private var isPasswordErrorAlertPresented = false
    
    let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[^a-zA-Z\\d])\\S{8,}$"
    
    var body: some View {
        GeometryReader { geometry in
            
        
        NavigationView {
            
            VStack {
                Text("Create your profile")
                    .font(
                        Font.custom("Poppins", size: 32)
                            .weight(.bold)
                    )
                    .foregroundColor(.black)
                    .padding(20)
                Spacer()
                
               
                HStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 24, height: 24, alignment: .leading)
                        .background(
                            Image("User")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        )
                    Text("First Name")
                        .font(
                            Font.custom("Poppins", size: 16)
                                .weight(.medium))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 20)
                VStack {
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.clear)
                            .frame(width: 345, height: 56, alignment: .leading)
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                            )
                            TextField("   Enter Your Name", text: $name)
                                .font(Font.custom("Poppins", size: 12))
                                .kerning(0.06)
                                .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                                .frame(width: 128, height: 23.33333, alignment: .center)
                        
                        
                    }
                                    
                    VStack {
                        
                        HStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 24, height: 24, alignment: .leading)
                                .background(
                                    Image("Email")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                )
                            Text("Email")
                                .font(
                                    Font.custom("Poppins", size: 16)
                                        .weight(.medium))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.leading, 20)
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.clear)
                                    .frame(width: 345, height: 56, alignment: .leading)
                                    .background(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .inset(by: 0.5)
                                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                                    )
                                
                                TextField("   Enter Your Email", text: $email)
                                    .font(Font.custom("Poppins", size: 12))
                                    .kerning(0.06)
                                    .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                                    .frame(width: 128, height: 23.33333, alignment: .center)
                            }
                            
                            VStack {
                                HStack {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 24, height: 24, alignment: .leading)
                                        .background(
                                            Image("Lock")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        )
                                    Text("Password")
                                        .font(
                                            Font.custom("Poppins", size: 16)
                                                .weight(.medium))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding(.leading, 20)
                                VStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundColor(.clear)
                                            .frame(width: 345, height: 56, alignment: .leading)
                                            .background(.white)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .inset(by: 0.5)
                                                    .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                                            )
                                        
                                        TextField("   Enter Your Password", text: $password)
                                            .font(Font.custom("Poppins", size: 12))
                                            .kerning(0.06)
                                            .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                                            .frame(width: 128, height: 23.33333, alignment: .center)
                                    }
                                    VStack {
                                        Text("Minimum of 8 characters, 1 capital letter, 1 lowercase letter, 1 other non alphabetic and 1 numeric character.")
                                            .font(Font.custom("Poppins", size: 12))
                                            .kerning(0.06)
                                            .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                                    }
                                    Spacer()
                                    
                                    Button(action: {
                                                                            if validatePasswordComplexity(password) {
                                                                                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                                                                                    if let error = error {
                                                                                        print("Sign up failed: \(error.localizedDescription)")
                                                                                    } else {
                                                                                        // Handle successful sign up
                                                                                        // You can also consider directly navigating to the next view here
                                                                                        showOnboarding_3 = true
                                                                                    }
                                                                                }
                                                                            } else {
                                                                                isPasswordErrorAlertPresented = true
                                                                            }
                                                                        }) {
                                                                            Text("Next")
                                                                                .font(Font.custom("Poppins-Black", size: 20).weight(.semibold))
                                                                                .multilineTextAlignment(.center)
                                                                                .foregroundColor(.white)
                                                                        }
                                                                        .buttonStyle(PlainButtonStyle())
                                                                        .padding(.horizontal, 30)
                                                                        .padding(.vertical, 20)
                                                                        .frame(width: 308, alignment: .center)
                                                                        .background(Color(red: 1, green: 0.08, blue: 0.41))
                                                                        .cornerRadius(15)
                                                                        .fullScreenCover(isPresented: $showOnboarding_3) {
                                                                            Onboarding_3()
                                                                        }
                                                                        .alert(isPresented: $isPasswordErrorAlertPresented) {
                                                                            Alert(title: Text("Password Error"), message: Text("Password does not meet complexity requirements."), dismissButton: .default(Text("OK")))
                                                                        }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                .navigationViewStyle(StackNavigationViewStyle())
                                                .background(.white)
                                            }
                                        }
                                        
                                        func validatePasswordComplexity(_ password: String) -> Bool {
                                            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
                                            return passwordPredicate.evaluate(with: password)
                                        }
                                    }

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
