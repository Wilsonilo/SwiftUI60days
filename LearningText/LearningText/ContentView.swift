//
//  ContentView.swift
//  LearningText
//
//  Created by Wilson Munoz on 04/12/19.
//  Copyright © 2019 Wilson Munoz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Text("Hello, World!")
                .font(.system(size: 50, weight: .heavy, design: .rounded))
            .fontWeight(.heavy)
            .padding(.bottom, 30)
            Text("Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma—which is living with the results of other people’s thinking. Don’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.gray).lineLimit(4)
                .multilineTextAlignment(.center)
//                .truncationMode(.head)
//                .rotationEffect(.init(degrees: 45))
//                .shadow(color: .gray, radius: 1, x: 0, y: 5)
//            .rotationEffect(.degrees(20), anchor: UnitPoint(x: 0, y: 0))
//            .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
        }

        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
