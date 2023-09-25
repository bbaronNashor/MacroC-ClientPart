//
//  Busking.swift
//  MacroC-ClientPart
//
//  Created by Kimjaekyeong on 2023/09/22.
//

import Foundation
import MapKit

struct Busking: Codable, Identifiable {
    //BuskerInfo
    var id: UUID
    var name: String
    var image: String
    //TimeInfo
    var time: String
    //LocationInfo
    var latitude: Double
    var longitude: Double
    //ComputedLocationInfo
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}
