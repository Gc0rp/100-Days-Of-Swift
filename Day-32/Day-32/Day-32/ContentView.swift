//
//  ContentView.swift
//  Day-32
//
//  Created by Ojas Gupta on 17/12/2022.
//

import SwiftUI

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

struct ContentView: View {
    @State private var animationAmount = 0.0
    var body: some View {
        Print(animationAmount)

//        Button("Tap Me") {
//            // do nothing
//            animationAmount += 1
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .overlay(
//            Circle()
//                .stroke(.red)
//                .scaleEffect(animationAmount)
//                .opacity(2 - animationAmount)
//                .animation(.easeOut(duration: 1).repeatForever( autoreverses: true), value: animationAmount)
//        )
//        .onAppear {
//            animationAmount = 2
//        }
        
        
//        return VStack {
//            Stepper("Scale Amount", value: $animationAmount.animation(), in: 1...10)
//            Spacer()
//            Button("Tap Me") {
//                animationAmount += 1
//            }
//            .padding(50)
//            .background(.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//        }
        
        
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)){
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
