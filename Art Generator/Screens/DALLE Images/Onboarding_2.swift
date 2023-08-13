//
//  Onboarding_2.swift
//  Art Generator
//
//  Created by Ellie on 7/6/23.
//

import SwiftUI

struct Onboarding_2: View {
    @State var isLoginActive:Bool = false
    @State var isSignUpActive:Bool = false
    @State var showLoginView: Bool = false
    @State var showSignupView: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(maxWidth: 461, maxHeight: .infinity, alignment: .top)
                        .ignoresSafeArea()
                        .background(
                            Image("landing2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 461, maxHeight: .infinity, alignment: .top)
                                .ignoresSafeArea()
                            
                        )
                    Spacer()
                    Text("CreativeCanvas")
                        .font(Font.custom("Fredoka One", size: 39))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 1, green: 0.08, blue: 0.41))
                        .frame(width: 360, height: 46, alignment: .top)
                    
                    Text("Unleash Your Imagination with CreativeCanvas: Where Art Comes Alive!")
                        .font(
                            Font.custom("Poppins", size: 14)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                        .frame(width: 297, height: 44, alignment: .top)
                    Spacer()
                    
                    VStack {
                        Button(action: {
                            showLoginView = true
                        }) {
                            
                            Text("Login")
                                .font(
                                    Font.custom("Poppins-Black", size: 20)
                                        .weight(.semibold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal, 30)
                        .padding(.vertical, 20)
                        .frame(width: 308, alignment: .center)
                        .background(Color(red: 1, green: 0.08, blue: 0.41))
                        .cornerRadius(15)
                        .fullScreenCover(isPresented: $showLoginView) {
                            LoginView()
                        }
                        
                        
                        Button(action: {
                            showSignupView = true
                        }) {
                            
                            Text("Sign Up")
                                .font(
                                    Font.custom("Poppins-Black", size: 20)
                                        .weight(.semibold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 1, green: 0.08, blue: 0.41))
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal, 30)
                        .padding(.vertical, 20)
                        .frame(width: 308, alignment: .center)
                        .background(.white)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .inset(by: 0.5)
                                .stroke(Color(red: 1, green: 0.08, blue: 0.41), lineWidth: 1)
                        )
                        .fullScreenCover(isPresented: $showSignupView) {
                            SignupView()
                            
                        }
                        
                        
                    }
                }
            }
        }
    }
}
    
struct Onboarding_2_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_2()
    }
}
