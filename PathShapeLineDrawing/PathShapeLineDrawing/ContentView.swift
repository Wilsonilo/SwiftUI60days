//
//  ContentView.swift
//  PathShapeLineDrawing
//
//  Created by Wilson Munoz on 09/12/19.
//  Copyright © 2019 Wilson Munoz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
    //            Path() { path in
    //                path.move(to: CGPoint(x: 20, y: 20))
    //                path.addLine(to: CGPoint(x: 300, y: 20))
    //                path.addLine(to: CGPoint(x: 300, y: 200))
    //                path.addLine(to: CGPoint(x: 20, y: 200))
    //                path.closeSubpath()
    //            }
    //            //.fill(Color.green)
    //        .stroke(Color.green, lineWidth:10)
            
            
//            Path() { path in
//                path.move(to: CGPoint(x: 20, y: 60))
//                path.addLine(to: CGPoint(x: 40, y: 60))
//                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
//                path.addLine(to: CGPoint(x: 230, y: 60))
//                path.addLine(to: CGPoint(x: 230, y: 100))
//                path.addLine(to: CGPoint(x: 20, y: 100))
//            }
//            .fill(Color.purple)
            
            
//            ZStack {
//                Path() { path in
//                    path.move(to: CGPoint(x: 20, y: 60))
//                    path.addLine(to: CGPoint(x: 40, y: 60))
//                    path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
//                    path.addLine(to: CGPoint(x: 230, y: 60))
//                    path.addLine(to: CGPoint(x: 230, y: 100))
//                    path.addLine(to: CGPoint(x: 20, y: 100))
//                }
//                .fill(Color.purple)
//
//                Path() { path in
//                    path.move(to: CGPoint(x: 20, y: 60))
//                    path.addLine(to: CGPoint(x: 40, y: 60))
//                    path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
//                    path.addLine(to: CGPoint(x: 230, y: 60))
//                    path.addLine(to: CGPoint(x: 230, y: 100))
//                    path.addLine(to: CGPoint(x: 20, y: 100))
//                    path.closeSubpath()
//                }
//                .stroke(Color.black, lineWidth: 5)
//            }
            
//            Path { path in
//                path.move(to: CGPoint(x: 200, y: 200))
//                path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 90), clockwise: true)
//            }
//            .fill(Color.green)
            
//            Path() { path in
//                path.move(to: CGPoint(x: 0, y: 0))
//                path.addQuadCurve(to: CGPoint(x: 200, y: 0), control: CGPoint(x: 100, y: -20))
//                path.addRect(CGRect(x: 0, y: 0, width: 200, height: 40))
//            }
//            .fill(Color.green)
            Button(action: {
                // Action to perform
            }) {
                Text("Test")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(Dome().fill(Color.red))
            }
            Circle()
                .foregroundColor(.green)
                .frame(width: 200, height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                )
                
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Dome: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(x: rect.size.width/2, y: -(rect.size.width * 0.1)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))

        return path
    }
}
