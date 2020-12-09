//
//  WelcomeView.swift
//  parkingApp
//
//  Created by Nils Brand on 26.11.19.
//  Copyright © 2019 hypeTech. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ScrollView{
            VStack (spacing:20){
            MapView()
                .frame(height:300)
                .edgesIgnoringSafeArea(.top)
         
            VStack(alignment: .leading) {
                
                Text("Mobility Building")
                    .font(.title)
                HStack {
                        Text("VICINITY Smart Parking")
                        .font(.subheadline)
                    Spacer()
                        Text("Tromso, Norway")
                        .font(.subheadline)
                    }
                }.padding()
            //Spacer()
                Text("⚠️ Simulation Mode ⚠️")//.font(.title)
                Text("The VICINITY platform will be demonstrated on many different real-case scenarios, addressing cross-domain applications, showing the applicability of the proposed solution in different IoT ecosystems and revealing the value-added services that can be achieved.").font(.body).padding()
                //.padding(.leading)
                //.font(.subheadline)
                
                Image("vicinity-demosites-facilites").resizable().frame(width:380, height: 380)
                    
                

                Button(action: {
                    let hyperlink = "vicinity2020.eu/vicinity/"
                    let scheme = "https://"
                    let formattedString = scheme + hyperlink
                    let url = URL(string: formattedString)!
                    UIApplication.shared.open(url)
                   }) {
                   Text("More Info")
                }
                Spacer()
               
                
            }
        }.edgesIgnoringSafeArea(.top)
        .statusBar(hidden: true)
        
    }
}
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
