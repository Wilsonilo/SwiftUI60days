//
//  ContentView.swift
//  LearningStacks
//
//  Created by Wilson Munoz on 05/12/19.
//  Copyright © 2019 Wilson Munoz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            HStack(spacing:15){
                PricinvView(title: "Basic", price: "$9", textColor: .white, bgColor: Color.purple)
                ZStack {
                    PricinvView(title: "Pro", price: "$19", textColor: .gray, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    LabelPromotional(title: "Best for designer", offSet: CGSize(width: 0, height: 87))
                   
                }
                
                
            }.padding(.horizontal)
            
            ZStack() {
               PricinvView(title: "Team", price: "$299", textColor: .white, bgColor: Color.gray, icon: "wand.and.rays")
               LabelPromotional(title: "Perfect for teams with 20 members", offSet: CGSize(width: 0, height: 90))
            }
            Spacer()
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView:View{
    var body:some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }

            Spacer()
        }
        .padding()
            
    }
}
struct LabelPromotional:View{
    var title:String
    var offSet:CGSize
    var body:some View {
        Text(title)
            .font(.system(.caption, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(5)
            .background(Color(red: 255/255, green: 183/255, blue: 37/255))
        .offset(offSet)
    }
}
struct PricinvView: View{
    
    var title:String
    var price:String
    var textColor:Color
    var bgColor:Color
    var icon:String?
    var body:some View {
        VStack {
            icon.map({
                Image(systemName: $0)
                .font(.largeTitle)
                .foregroundColor(textColor)
            })
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
    }
    
}
