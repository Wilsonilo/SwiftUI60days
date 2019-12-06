//
//  ContentView.swift
//  ListsAndForms
//
//  Created by Wilson Munoz on 8/8/19.
//  Copyright © 2019 Wilson Munoz. All rights reserved.
//

import SwiftUI
import LinkPresentation
struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
}
struct RestaurantRow: View {
    var restaurant:Restaurant
    
    var body: some View {
        Text("Restaurant: \(restaurant.name)")
    }
    
}
struct DetailView: View {
    var body: some View {
        Text("Detail")
    }
}

struct ContentView: View {
    var body: some View {
        
//        let restaurants = [Restaurant(name: "Joe's Original"), Restaurant(name: "The Real Joe's Original"), Restaurant(name: "Original Joe's")]
//
//        return List(restaurants) { restaurant in
//            RestaurantRow(restaurant: restaurant)
//        }
        
        PresentationLink("Click to show", destination: DetailView())

    }
    

}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
