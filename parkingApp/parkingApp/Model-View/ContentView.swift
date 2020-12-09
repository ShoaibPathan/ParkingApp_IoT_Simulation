//
//  ContentView.swift
//  parkingApp
//
//  Created by Nils Brand on 26.11.19.
//  Copyright © 2019 hypeTech. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

struct ContentView: View {
        
    @State  var tabSelected = 0
    
    var body: some View {
        
        TabView(selection: $tabSelected) {
           
            WelcomeView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Welcome")
            }.tag(1)
                
            ParkView()
                .tabItem {
                    Image(systemName: "car.fill")
                    Text("Park")
            }.tag(2)
            
            InfoView()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("Info")
            }.tag(3)
        }
         .font(.headline).accentColor(Color.yellow)
         .statusBar(hidden: true).edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
