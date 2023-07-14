//
//  LocationModel.swift
//  Animals-SwiftUI
//
//  Created by Ivan Nikitin on 05.07.2023.
//

import Foundation
import MapKit

struct ParkLocationModel: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
