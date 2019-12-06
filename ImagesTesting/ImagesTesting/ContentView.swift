//
//  ContentView.swift
//  ImagesTesting
//
//  Created by Wilson Munoz on 04/12/19.
//  Copyright © 2019 Wilson Munoz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//        Image(systemName: "cloud.heavyrain").font(.system(size: 50, weight: .heavy, design: .rounded)).foregroundColor(.blue)
            
        //Image("eiffel").resizable()
            
            //Image("eiffel").resizable().edgesIgnoringSafeArea(.all)
            
            
            //Image("eiffel").resizable().scaledToFit().aspectRatio(contentMode: .fill).edgesIgnoringSafeArea(.all)
            
            
            //Image("eiffel").resizable().aspectRatio(contentMode: .fill).frame(width:300).clipped()
            
            
//            Image("eiffel").resizable().aspectRatio(contentMode: .fill).frame(width:300, height:300).clipShape(Circle())
//                .overlay(Image(systemName: "heart.fill")
//                        .font(.system(size: 50))
//                        .foregroundColor(.black)
//                        .opacity(0.5))
            
            
            
//            Image("eiffel").resizable().aspectRatio(contentMode: .fill).frame(height:500).clipShape(Circle())
//            .overlay(
//                Text("If you are lucky enough to have lived in Paris as a young man, then wherever you go for the rest of your life it stays with you, for Paris is a moveable feast.\n\n- Ernest Hemingway")
//                            .fontWeight(.heavy)
//                            .font(.system(.headline, design: .rounded))
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.black)
//                            .cornerRadius(10)
//                            .opacity(0.8)
//                            .padding(),
//
//                        alignment: .center )
                Image("eiffel")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    .overlay(
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.4)
                            .overlay(
                                Text("Paris")
                                    .font(.largeTitle)
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                                    .frame(width: 200)
                            )
                    )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
