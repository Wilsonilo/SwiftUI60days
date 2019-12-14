//
//  ContentView.swift
//  UsingGestures
//
//  Created by Wilson Munoz on 14/12/19.
//  Copyright © 2019 Wilson Munoz. All rights reserved.
//

import SwiftUI

//struct ContentView: View {
//    @State private var isPressed:Bool = false
//
//    @GestureState private var longPressTap = false
//    @GestureState private var dragOffset   = CGSize.zero
//    @State private var finalPosition       = CGSize.zero
//    var body: some View {
//
////        Image(systemName:"star.circle.fill")
////            .font(.system(size:200))
////            .scaleEffect(isPressed ? 0.5 : 1.0)
////            .animation(.easeInOut)
////            .foregroundColor(.green)
////            .gesture(
////
////
////                //One tap
//////                TapGesture().onEnded({ _ in
//////                    self.isPressed.toggle()
//////                })
////
////                //LongPress
////                LongPressGesture(minimumDuration: 1.0).onEnded({ _ in
////                    self.isPressed.toggle()
////                })
////            )
//
////        Image(systemName: "star.circle.fill")
////            .font(.system(size: 200))
////            .opacity(longPressTap ? 0.4 : 1.0)
////            .scaleEffect(isPressed ? 0.5 : 1.0)
////            .animation(.easeInOut)
////            .foregroundColor(longPressTap ? .gray : .green)
////            .gesture(
////                LongPressGesture(minimumDuration: 1.0)
////                    .updating($longPressTap, body: { (currentState, state, transaction) in
////                        state = currentState
////                    })
////                    .onEnded({ _ in
////                        self.isPressed.toggle()
////                    })
////            )
//
//        Image(systemName: "star.circle.fill")
//                    .font(.system(size: 100))
//            .offset(x: finalPosition.width + dragOffset.width, y: finalPosition.height + dragOffset.height)
//                    .animation(.easeInOut)
//                    .foregroundColor(.green)
//                    .gesture(
//                        DragGesture()
//                            .updating($dragOffset, body: { (value, state, transaction) in
//
//                                state = value.translation
//                            })
//                            .onEnded({ (value) in
//                                self.finalPosition.height += value.translation.height
//                                self.finalPosition.width += value.translation.width
//                            })
//                    )
//    }
//}



struct ContentView: View {
    // For long press gesture
    @GestureState private var dragState = DragState.inactive
    @State private var position = CGSize.zero

    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: position.width + dragState.translation.width, y: position.height + dragState.translation.height)
            .animation(.easeInOut)
            .foregroundColor(.green)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                .sequenced(before: DragGesture())
                .updating($dragState, body: { (value, state, transaction) in

                    switch value {
                    case .first(true):
                        state = .pressing
                    case .second(true, let drag):
                        state = .dragging(translation: drag?.translation ?? .zero)
                    default:
                        break
                    }

                })
                .onEnded({ (value) in

                    guard case .second(true, let drag?) = value else {
                        return
                    }

                    self.position.height += drag.translation.height
                    self.position.width += drag.translation.width
                })
            )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



