//
//  InfoView.swift
//  parkingApp
//
//  Created by Nils Brand on 26.11.19.
//  Copyright © 2019 hypeTech. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

struct InfoView: View {
    
    var body: some View {
        ScrollView{
            VStack{
            Text("Further Information").font(.largeTitle).foregroundColor(.yellow)
            Text("VICINITY will build and demonstrate a device and standard agnostic platform for IoT infrastructures that will offer Interoperability as a Service. This application represents a Bachelorthesis of Nils Brand. The work was done at the group of cyber-physical systems at Technische Universität Kaiserslautern. The goal of this work was to establish a connection from a mobile application to an OMNeT++ simulation with focus on a VICINITY use-case. So the Bachelorthesis addesses topics round about networking, discrete-event system simulation and iOS development. The implemented use-case is about the smart parking pilot side which is located in Tromso, Norway. However the use-case itself can be tried out within the park tab of this app.").padding().font(.body)
            }
            Text("The VICINITY project is structed as follows:")//.padding()
            Image("vicinity-overview-pic").resizable().frame(width:340, height: 330).padding()
        
            VStack(alignment: .leading){
                  Text("Imprint")
                  Text("Prof. Dr. Christoph Grimm")
            
                HStack{
                    Text("Coordinator")
                                        
                                        Button(action: {
                                           let hyperlink = "vicinity2020.eu/vicinity/"
                                                              let scheme = "https://"
                                                              let formattedString = scheme + hyperlink
                                                              let url = URL(string: formattedString)!
                                                              UIApplication.shared.open(url)
                                           }) {
                                           Text("VICINITY project").foregroundColor(.gray)
                                        }
                           }
                  Text("Department of Computer Science")
                  Text("Group of Design of Cyber-Physical Systems")
                  Text("TU Kaiserslautern")
                  Button(action: {
                    let hyperlink = "maps.apple.com/?address=Gottlieb-Daimler-Stra%C3%9Fe%2047,%2067663%20Kaiserslautern,%20Deutschland&ll=49.424132,7.754733&q=Gottlieb-Daimler-Stra%C3%9Fe%2047&_ext=EiYpM60Dx7a1SEAxceYLjMb9HkA5sYIpI922SEBBq8t16OoLH0BQBA%3D%3D"
                    let scheme = "https://"
                    let formattedString = scheme + hyperlink
                    let url = URL(string: formattedString)!
                    UIApplication.shared.open(url)
                   }) {
                    Text("Gottlieb Daimler Straße 47").foregroundColor(.gray)
                }
        
                  Text("67663 Kaiserslautern")
                  
            HStack{
                Text("Tel.:")
                Button(action: {
                    let strNumber = "+49 631 205 3283"
                    let tel = "tel://"
                    let formattedString = tel + strNumber
                    let url = URL(string: formattedString)!
                    UIApplication.shared.open(url)
                   }) {
                   Text("+49 631 205 3283").foregroundColor(.gray)
                }
                
            }
            HStack{
                         Text("Mail:")
                         Button(action: {
                            sendemail()
                            }) {
                            Text("coordinator@vicinity-h2020.eu").foregroundColor(.gray)
                         }
            }
            
        }.font(.body)
            
            Image("vicinity-logo").resizable().frame(width:240, height:90).padding()
            Image("EC-H2020").resizable().frame(width:240, height: 40).padding()
            
            Image("CPS_Logo").resizable().frame(width:110, height: 83.5).padding()
            
            HStack(){
               Text("Made with")
                   Image(systemName: "heart.fill").foregroundColor(Color.red)
                Text("in Kaiserslautern")
                    }.font(.footnote).padding()
        }
    }

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
}
