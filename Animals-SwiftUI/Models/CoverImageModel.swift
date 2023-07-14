//
//  CoverImageModel.swift
//  Animals-SwiftUI
//
//  Created by Ivan Nikitin on 05.07.2023.
//

import Foundation

struct CoverImageModel: Codable, Identifiable {
    let id: Int
    let name: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
}

