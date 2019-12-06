//
//  ContentView.swift
//  ScrollViewAndCarousel
//
//  Created by Wilson Munoz on 06/12/19.
//  Copyright © 2019 Wilson Munoz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    

    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
                    .frame(width: 300)
                CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                    .frame(width: 300)
                CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
                    .frame(width: 300)
                CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kam” bampati")
                                    .frame(width: 300)
            }
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
