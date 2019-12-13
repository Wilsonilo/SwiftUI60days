//
//  ContentView.swift
//  AnimationsAndTransitions
//
//  Created by Wilson Munoz on 09/12/19.
//  Copyright © 2019 Wilson Munoz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    @State private var isLoading = false
    @State private var show = false
    var body: some View {

//        ZStack {
//            Circle()
//                .frame(width: 200, height: 200)
//                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
//
//            Image(systemName: "heart.fill")
//                .foregroundColor(heartColorChanged ? .red : .white)
//                .font(.system(size: 100))
//                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
//        }
////        .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3))
//        .onTapGesture {
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
//
//                self.heartSizeChanged.toggle()
//            }
//            self.circleColorChanged.toggle()
//            self.heartColorChanged.toggle()
//        }
        
        
//        Circle()
//                    .trim(from: 0, to: 0.7)
//                    .stroke(Color.green, lineWidth: 5)
//                    .frame(width: 100, height: 100)
//                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
//                    .animation(Animation.default.repeatForever(autoreverses: false))
//                    .onAppear() {
//                        self.isLoading = true
//                    }
        
        VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 300)
                        .foregroundColor(.green)
                        .overlay(
                            Text("Show details")
                                .font(.system(.largeTitle, design: .rounded))
                                .bold()
                                .foregroundColor(.white)

                    )
                    
            if show {
                                  RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 300)
                        .foregroundColor(.purple)
                        .overlay(Text("Well, here is the details")
                                                .font(.system(.largeTitle, design: .rounded))
                                                .bold()
                                                .foregroundColor(.white)
                                  ).transition(.scale(scale: 0, anchor: .bottom))
                
            }
        }.onTapGesture {
                    
                    withAnimation(Animation.spring())
                                   {
                    self.show.toggle()
                    }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
