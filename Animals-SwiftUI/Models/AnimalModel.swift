//
//  AnimalModel.swift
//  Animals-SwiftUI
//
//  Created by Ivan Nikitin on 05.07.2023.
//

import Foundation

struct AnimalModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.headline = try container.decode(String.self, forKey: .headline)
        self.description = try container.decode(String.self, forKey: .description)
        self.link = try container.decode(String.self, forKey: .link)
        self.image = try container.decode(String.self, forKey: .image)
        self.gallery = try container.decode([String].self, forKey: .gallery)
        self.fact = try container.decode([String].self, forKey: .fact)
    }
}
