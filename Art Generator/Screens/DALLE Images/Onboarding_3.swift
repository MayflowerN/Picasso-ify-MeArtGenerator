//
//  Onboarding_3.swift
//  Art Generator
//
//  Created by Ellie on 7/11/23.
//

import SwiftUI

struct Onboarding_3: View {
    @State private var isAbstractSelected = false
    @State private var isRealisticSelected = false
    @State private var isSimpleComplexitySelected = false
    @State private var isMediumComplexitySelected = false
    @State private var isHighlyComplexitySelected = false
    
    @State private var tabSelection = 0
    @State private var showOnboarding_2 = false
    @State private var showDALLEImagesView = false
    
    private let pink = Color(red: 1, green: 0.08, blue: 0.41)
    private let pink2 = Color(red: 1, green: 0.89, blue: 0.93)
    
    var body: some View {
        NavigationView {
            VStack {
                
                TabView(selection: $tabSelection) {
                    VStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(maxWidth: .infinity, maxHeight: 360)
                            .background(
                                Image("landing3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: .infinity, maxHeight: 360)
                                    .clipped()
                            )
                        
                        Text("Are you interested in abstract or realistic art?")
                            .font(Font.custom("Poppins", size: 24).weight(.bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 349, height: 68, alignment: .top)
                            .padding()
                        HStack {
                            Image(systemName: isAbstractSelected ? "checkmark.square.fill" : "square")
                                .frame(width: 10, height: 10)
                                .font(.system(size: 40))
                                .foregroundColor(isAbstractSelected ? .black : .black)
                                .rotationEffect(.degrees(isAbstractSelected ? 0 : -360))
                                .scaleEffect(isAbstractSelected ? 1.2 : 1.0)
                                .animation(.spring())
                                .padding(20)
                                .onTapGesture {
                                    isAbstractSelected.toggle()
                                }
                            Text(" Abstract art")
                                .font(Font.custom("Poppins", size: 17).weight(.medium))
                                .foregroundColor(.black)
                                .frame(width: 200, height: 22, alignment: .leading)
                            
                        }
                        VStack {
                            HStack {
                                Image(systemName: isRealisticSelected ? "checkmark.square.fill" : "square")
                                    .frame(width: 10, height: 10)
                                    .font(.system(size: 40))
                                    .foregroundColor(isRealisticSelected ? .black : .black)
                                    .rotationEffect(.degrees(isRealisticSelected ? 0 : -360))
                                    .scaleEffect(isRealisticSelected ? 1.2 : 1.0)
                                    .animation(.spring())
                                    .padding(.bottom, 20)
                                    .onTapGesture {
                                        isRealisticSelected.toggle()
                                    }
                                Text("Realistic realistic")
                                    .font(Font.custom("Poppins", size: 17).weight(.medium))
                                    .foregroundColor(.black)
                                    .frame(width: 200, height: 22, alignment: .center)
                                    .padding(.bottom, 20)
                            }
                            .padding(10)
                        }
                    }
                    
                    .tag(0)
                    
                    VStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 380, height: 360)
                            .background(
                                Image("landing4")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 380, height: 360)
                                    .clipped()
                            )
                        Text("What level of complexity or simplicity appeals to you?")
                            .font(Font.custom("Poppins", size: 24).weight(.bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 349, height: 68, alignment: .top)
                            .padding()
                        HStack {
                            Image(systemName: isSimpleComplexitySelected ? "checkmark.square.fill" : "square")
                                .frame(width: 22, height: 22)
                                .font(.system(size: 40))
                                .foregroundColor(isSimpleComplexitySelected ? .black : .black)
                                .rotationEffect(.degrees(isSimpleComplexitySelected ? 0 : -360))
                                .scaleEffect(isSimpleComplexitySelected ? 1.2 : 1.0)
                                .animation(.spring())
                                .padding(.bottom, 20)
                                .onTapGesture {
                                    isSimpleComplexitySelected.toggle()
                                }
                            Text("Simple Complexity")
                                .font(Font.custom("Poppins", size: 17).weight(.light))
                                .foregroundColor(.black)
                                .frame(width: 200, height: 25, alignment: .center)
                                .padding(.bottom, 20)
                        }
                        VStack {
                            HStack {
                                Image(systemName: isMediumComplexitySelected ? "checkmark.square.fill" : "square")
                                    .frame(width: 22, height: 22)
                                    .font(.system(size: 40))
                                    .foregroundColor(isMediumComplexitySelected ? .black : .black)
                                    .rotationEffect(.degrees(isMediumComplexitySelected ? 0 : -360))
                                    .scaleEffect(isMediumComplexitySelected ? 1.2 : 1.0)
                                    .animation(.spring())
                                    .padding(.bottom, 20)
                                    .onTapGesture {
                                        isMediumComplexitySelected.toggle()
                                    }
                                Text("Medium Complexity")
                                    .font(Font.custom("Poppins", size: 17).weight(.medium))
                                    .foregroundColor(.black)
                                    .frame(width: 200, height: 22, alignment: .center)
                                    .padding(.bottom, 20)
                            }
                            HStack {
                                Image(systemName: isHighlyComplexitySelected ? "checkmark.square.fill" : "square")
                                    .frame(width: 22, height: 22)
                                    .font(.system(size: 40))
                                    .foregroundColor(isHighlyComplexitySelected ? .black : .black)
                                    .rotationEffect(.degrees(isHighlyComplexitySelected ? 0 : -360))
                                    .scaleEffect(isHighlyComplexitySelected ? 1.2 : 1.0)
                                    .animation(.spring())
                                    .padding(.bottom, 50)
                                    .onTapGesture {
                                        isHighlyComplexitySelected.toggle()
                                    }
                                Text("Highly Complexity")
                                    .font(Font.custom("Poppins", size: 17).weight(.medium))
                                    .foregroundColor(.black)
                                    .frame(width: 200, height: 22, alignment: .center)
                                    .padding(.bottom, 50)
                            }
                        }
                    }
                    .tag(1)
                }
                .accentColor(tabSelection == 0 ? pink : pink2)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
                .padding()
            
            
                
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        if tabSelection == 0 {
                            showOnboarding_2 = true
                        } else {
                            tabSelection = 0
                        }
                    }) {
                        Text("Back")
                            .font(
                                Font.custom("Poppins", size: 20)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.08, blue: 0.41))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal, 30)
                    .padding(.vertical, 30)
                    .frame(width: 135, height: 60, alignment: .center)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .inset(by: 1)
                            .stroke(Color(red: 1, green: 0.08, blue: 0.41), lineWidth: 2)
                    )
                    Spacer()
                    Button(action: {
                        if tabSelection == 0 {
                            tabSelection = 1
                        } else {
                            showDALLEImagesView = true
                        }
                    }) {
                        Text(tabSelection == 0 ? "Next" : "Finish")
                            .font(
                                Font.custom("Poppins", size: 20)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal, 30)
                    .padding(.vertical, 30)
                    .frame(width: 135, height: 60, alignment: .center)
                    .background(Color(red: 1, green: 0.08, blue: 0.41))
                    .cornerRadius(15)
                    Spacer()
                }
               
               
            }
            .fullScreenCover(isPresented: $showOnboarding_2) {
                Onboarding_2()
            }
            .fullScreenCover(isPresented: $showDALLEImagesView) {
                DALLEImagesView()
            }
        }
    }
}

struct Onboarding_3_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_3()
    }
}





