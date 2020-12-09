//
//  ParkService.swift
//  parkingApp
//
//  Created by Nils Brand on 03.12.19.
//  Copyright © 2019 hypeTech. All rights reserved.
//

import Foundation

func simPark_visualIndicator(){
                  let sessionPark = URLSession.shared
                  let urlPark = URL(string: "http://DESTINATION_IPADDRESS:4242/adapter/objects/visualIndicator/properties/state")!
                
                  var requestPark = URLRequest(url: urlPark)
                  requestPark.httpMethod = "PUT"
                  requestPark.setValue("application/json", forHTTPHeaderField: "Content-Type")
                  requestPark.setValue("Powered by Swift!", forHTTPHeaderField: "X-Powered-By")

                 let parkVisualIndicator = try! JSONSerialization.data(withJSONObject: SetVisualIndicator, options: [])
    
                 let taskVisiualIndicator = sessionPark.uploadTask(with: requestPark, from: parkVisualIndicator) { data, response, error in
                   if let httpResponseParkVisualIndicator = response as? HTTPURLResponse {
                       print(httpResponseParkVisualIndicator.statusCode) //HTTP converted answer like 200, 404, ...
                       }
                   }
                   taskVisiualIndicator.resume()
              }

func simPark_floorSensor(){
              let sessionPark = URLSession.shared
              let urlPark = URL(string: "http://DESTINATION_IPADDRESS:4242/adapter/objects/floorSensor/properties/state")!
            
              var requestPark = URLRequest(url: urlPark)
              requestPark.httpMethod = "PUT"
              requestPark.setValue("application/json", forHTTPHeaderField: "Content-Type")
              requestPark.setValue("Powered by Swift!", forHTTPHeaderField: "X-Powered-By")

             let parkFloorSensor = try! JSONSerialization.data(withJSONObject: SetFloorSensor, options: [])
    
             let taskFloorSensor = sessionPark.uploadTask(with: requestPark, from: parkFloorSensor) { data, response, error in
                if let httpResponseParkFloorSensor = response as? HTTPURLResponse {
                    print(httpResponseParkFloorSensor.statusCode) //HTTP converted answer like 200, 404, ...
                    }
                }
                taskFloorSensor.resume()
          }
