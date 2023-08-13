//
//  Fetching.swift
//  Art Generator
//
//  Created by Ellie on 6/22/23.
//

import SwiftUI

struct Fetching: View {
    @State private var rotation = 0.0
    var body: some View {
        ZStack {
            Image("Artist")
            Text("⭐️").font(.system(size: 70))
                .offset(x: -135)
                .rotationEffect(.degrees(rotation))
                .animation(Animation.linear
                    .speed(0.2)
                    .repeatForever(autoreverses: false), value: rotation)
        }
        .onAppear{
            rotation = 360
        }
    }
}

struct Fetching_Previews: PreviewProvider {
    static var previews: some View {
        Fetching()
    }
}
