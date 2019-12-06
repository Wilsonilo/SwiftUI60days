//
//  ContentView.swift
//  TextView
//
//  Created by Wilson Munoz on 8/8/19.
//  Copyright © 2019 Wilson Munoz. All rights reserved.
//

import SwiftUI
import Combine
class UserSettings: BindableObject {
    var didChange = PassthroughSubject<Void, Never>()

    var score = 0 {
        didSet {
            didChange.send(())
        }
    }
}

struct ContentView: View {
    
    struct Result: Identifiable {
        var id = UUID()
        var score: Int
    }
    let results = [Result(score: 8), Result(score: 5), Result(score: 10)]
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = 0
    @State var showGreeting = true
    @State var name: String = "Wilson"

    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    @ObjectBinding var settings = UserSettings()

    var dueDate = Date()
    let basicText = "Hello World Hello WorldHello WorldHello World Hello World Hello WorldHello WorldHello World Hello World Hello WorldHello WorldHello World Hello World Hello WorldHello WorldHello World Hello World Hello WorldHello WorldHello World Hello World Hello WorldHello WorldHello World Hello World Hello WorldHello WorldHello World Hello World Hello WorldHello WorldHello World"
    var body: some View {
        VStack {
            Text("Your score is \(settings.score)")
            Button(action: {
                self.settings.score += 1
            }) {
                Text("Increase Score")
            }
        }
//        VStack {
            

//            Picker(selection: $selectedColor, label: Text("Please choose a color")){
//                Text("Red").tag(0)
//                Text("Green").tag(1)
//                Text("Blue").tag(2)
//            }
//            Text("Value: \(selectedColor)")
//            Toggle(isOn: $showGreeting) {
//                Text("Show welcome message")
//            }.padding()
//
//            if showGreeting {
//                Text("Hello World!")
//            }
            
//            Button(action: {
//                self.showGreeting.toggle()
//            }) {
//                Text("Show details")
//            }
//
//            if showGreeting {
//                Text("You should follow me on Twitter: @twostraws")
//                    .font(.largeTitle)
//                    .lineLimit(nil)
//            }
//
//
//            TextField("Enter your name", text: $name).textFieldStyle(RoundedBorderTextFieldStyle())
//            Text(name).onTapGesture(count: 2) {
//                self.name = "Double Tapped!"
//            }
//            Image(systemName: "cloud.heavyrain.fill")
//            .gesture(
//                DragGesture(minimumDistance: 50)
//                    .onEnded { _ in
//                        print("Dragged!")
//                    }
//            )
////
//            Picker(selection: $selectedColor, label: Text("Please choose a color")) {
//               ForEach(0 ..< colors.count) {
//                  Text(self.colors[$0]).tag($0)
//               }
//            }
//            Text("You selected: \(colors[selectedColor])")
     
//        VStack(alignment: .leading, spacing: 20) {
//
//            Toggle(isOn: $showGreeting) {
//                Text("Show welcome message")
//            }.padding()
//
//            if showGreeting {
//                Text("Hello World!")
//            }
//
//
//            ///Basic formatting
//            Text(basicText)
//                .lineLimit(3).font(.body).multilineTextAlignment(.center).foregroundColor(Color.red).lineSpacing(20) // Is this css? :D
//            Divider()
//            //Formatter
//            Text("Due date: \(dueDate, formatter: Self.taskDateFormat)")
//            Divider()
//            // Images
//            Image(systemName: "cloud.heavyrain.fill").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color.red)
//
//            ///Gradients
//            Divider()
//            HStack(alignment: .center) {
//                Text("Hello World")
//                .padding()
//                .foregroundColor(.white)
//                .background(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom), cornerRadius: 0)
//                    .padding(.leading, 30)
//                Divider()
//                Text("Hello World")
//                .padding()
//                .foregroundColor(.white)
//                    .background(RoundedRectangle(cornerRadius: 0).background(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom).fixedSize()), alignment: .center)
//            }
//            Divider()
//
//            ///Shapes
//            Rectangle()
//            .fill(Color.red)
//            .frame(width: 200, height: 200).padding(.leading, 100)
//
//            ///ForEach
//            Divider()
////            ForEach(results) { result in
////                Text("Result: \(result.score)")
////            }
//
//
//        }

        
        NavigationView {
            NavigationLink(destination: DetailView()) {
                Text("Hello World")
            }
        }.onAppear {
            print("ContentView appeared!")
        }.onDisappear {
            print("ContentView disappeared!")
        }
    }
}


struct DetailView : View {
    var body: some View {
        VStack {
            Text("Second View")
        }.onAppear {
                print("DetailView appeared!")
        }.onDisappear {
                print("DetailView disappeared!")
        }
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
