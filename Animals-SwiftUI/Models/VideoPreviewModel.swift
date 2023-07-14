//
//  VideoPreviewModel.swift
//  Animals-SwiftUI
//
//  Created by Ivan Nikitin on 10.07.2023.
//

import Foundation

struct VideoPreviewModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
