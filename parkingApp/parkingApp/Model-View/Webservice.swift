//
//  Webservice.swift
//  parkingApp
//
//  Created by Nils Brand on 27.11.19.
//  Copyright © 2019 hypeTech. All rights reserved.
//

import Foundation
import Combine


class Webservice:ObservableObject {
    @Published var simInfo: [simRequest] = [simRequest]()
    @Published var dataHasLoaded = false
    
    func simCall() {
        
        let session = URLSession.shared
        let url = URL(string: "http://DESTINATION_IPADDRESS:4242/adapter/objects/floorSensor/properties/state")!
//vorher war als onch visualIndicator eingestellt in der URI
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }

            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }

            do {
                let simResponse = try JSONDecoder().decode(simRequest.self, from: data!)
                print(simResponse)
               
                DispatchQueue.main.async {
                    self.simInfo = [simResponse]
                    self.dataHasLoaded = true
                    //print(self.simInfo[0].value)
                }
                return
           
            }  catch {
                print("JSON error: \(error.localizedDescription)")
                }
        }
        task.resume()
        //Newly-initialized tasks begin in a suspended state, so you need to call this method to start the task.
    }
/* init() {
        simCall()
    } if initialization is desired*/
}
