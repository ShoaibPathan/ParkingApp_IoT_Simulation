//
//  Model.swift
//  parkingApp
//
//  Created by Nils Brand on 08.01.20.
//  Copyright © 2020 hypeTech. All rights reserved.
//

import Foundation

struct vicinityRequest:Decodable {
  
    var adapterID: String
    var thingDescriptions: [objects]
    
    struct objects: Decodable {
        var oid: String
        var name: String
        var properties:[property]
        
        struct property: Decodable {
            var pid: String
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case adapterID = "adapter-id"
        case thingDescriptions = "thing-descriptions"
    }
}



struct simRequest:Decodable {
    var value: String
}
