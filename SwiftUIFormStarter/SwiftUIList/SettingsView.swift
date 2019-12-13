//
//  SettingsView.swift
//  SwiftUIList
//
//  Created by Wilson Munoz on 13/12/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var settingStore:SettingStore
    @Environment(\.presentationMode) private var presentationMode;
    @State private var selectedOrder   = DisplayOrderType.alphabetical
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel   = 5 {
        
        didSet {
            if maxPriceLevel > 5 {
                maxPriceLevel = 5
            }
            
            if maxPriceLevel < 1 {
                maxPriceLevel = 1
            }
        }
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("SORT PREFERENCE")) {
                    Picker(selection: $selectedOrder, label: Text("Display Order")) {
                        ForEach(DisplayOrderType.allCases, id:\.self) { orderType in
                            Text(orderType.text)
                        }
                    }
                }
                
                Section(header: Text("FILTER PREFERENCE")) {
                    
                    Toggle(isOn: $showCheckInOnly) {
                        Text("Show Check-in Only")
                    }
                    
                    Stepper(onIncrement: {
                        
                        self.maxPriceLevel += 1
                        
                    }, onDecrement: {
                        
                        self.maxPriceLevel -= 1
                        
                    }) {
                        
                        Text("Show \(String(repeating: "$", count: maxPriceLevel)) or below")
                    }
                }
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                }).foregroundColor(.black)
            , trailing:
                Button(action: {
                    self.settingStore.showCheckInOnly = self.showCheckInOnly
                    self.settingStore.displayOrder = self.selectedOrder
                    self.settingStore.maxPriceLevel = self.maxPriceLevel
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Save")
                }).foregroundColor(.black)
            )
        }.onAppear {
            self.selectedOrder = self.settingStore.displayOrder
            self.showCheckInOnly = self.settingStore.showCheckInOnly
            self.maxPriceLevel = self.settingStore.maxPriceLevel
        }
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(SettingStore())
    }
}
