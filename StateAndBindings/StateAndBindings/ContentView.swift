//
//  ContentView.swift
//  StateAndBindings
//
//  Created by Wilson Munoz on 09/12/19.
//  Copyright © 2019 Wilson Munoz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //@State private var isPlaying = false
    @State private var counter      = 1
    @State private var counterTwo   = 1
    @State private var counterThree = 1

    var body: some View {
        //Image(systemName: "play.circle.fill").font(.system(size:150)).foregroundColor(isPlaying ? .green : .red)
        VStack {
            Text(String(counter + counterTwo + counterThree))
            HStack {
                ButtonView(counter: $counter, color: .red)
                ButtonView(counter: $counterTwo, color: .blue)
                ButtonView(counter: $counterThree, color: .yellow)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ButtonView: View {
    @Binding var counter: Int
    var color:Color
    var body: some View {
        Button(action: {
            self.counter += 1
        }) {
            Circle().frame(width: 50, height: 50)
                .foregroundColor(self.color)
            .overlay(
                Text("\(self.counter)").font(.system(size: 100, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            )
        }
    }
}
