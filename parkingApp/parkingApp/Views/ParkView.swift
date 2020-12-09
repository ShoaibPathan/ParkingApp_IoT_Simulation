//
//  ParkView.swift
//  parkingApp
//
//  Created by Nils Brand on 26.11.19.
//  Copyright © 2019 hypeTech. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

struct ParkView: View {
    @ObservedObject var webservice: Webservice = Webservice()
   
    //@State var buttonPressed = false
    
     
     var body: some View {
            VStack(spacing:30) {
                
                MTSlideToOpen(thumbnailLeadingTrailingPadding: 10,
                                         thumbnailColor:Color.yellow,
                                         thumbnailBackgroundColor: Color.yellow,
                                         didReachEndAction: { view in
                                            simPark_visualIndicator()
                                            simPark_floorSensor()
                                            
                            print("Slider reached end!!")
                                
                            DispatchQueue.main.async {
                                self.webservice.dataHasLoaded = false
                                            }
                             
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                   view.resetState()
                               }
                           })
                           .frame(width: 320, height: 56)
                           .background(Color.yellow)
                           .cornerRadius(28)
                
                    Group {
                    if webservice.dataHasLoaded == true { // == TRUE WURDE AM 11.01. HINZUGEFÜGT, stand da vorher irgendwie nicht
                        Text("Reserved Parking Lots: \(webservice.simInfo[0].value)")
                        
                    } else {
                        ActivityIndicator()
                        //Text("Loading...")
                        }
                    }.onAppear(perform: webservice.simCall)
                }
     }
}

struct ParkView_Previews: PreviewProvider {
    static var previews: some View {
        ParkView()
    }
}
