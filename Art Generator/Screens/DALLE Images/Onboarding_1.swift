//
//  Onboarding_1.swift
//  Art Generator
//
//  Created by Ellie on 7/6/23.
//

import SwiftUI

struct Onboarding_1: View {
    @State private var isActive: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 20) {  // Added some spacing for better visual separation
                    Spacer()
                    Text("CreativeCanvas")
                        .font(Font.custom("Fredoka One", size: UIScreen.main.bounds.width * 0.1)) // Scales with screen width
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 1, green: 0.08, blue: 0.41))
                    
                    Text("Unleash Your Imagination with CreativeCanvas: Where Art Comes Alive!")
                        .font(Font.custom("Poppins", size: UIScreen.main.bounds.width * 0.04) // Scales with screen width
                            .weight(.medium))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                        .padding(.horizontal, UIScreen.main.bounds.width * 0.05) // Provides relative padding
                    Spacer()
                    
                    Image("landing1")
                        .resizable()
                        .aspectRatio(contentMode: .fit) // Changed to .fit to avoid potential image clipping
                        .frame(width: UIScreen.main.bounds.width * 0.7) // Takes 70% of screen width
                    
                }
                .padding() // Added padding to ensure content doesn't touch the screen edges
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isActive = true
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $isActive) {
            Onboarding_2()
        }
    }
}

struct Onboarding_1_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_1()
    }
}
