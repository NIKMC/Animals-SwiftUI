//
//  ExternalWeblinkView.swift
//  Animals-SwiftUI
//
//  Created by Ivan Nikitin on 10.07.2023.
//

import SwiftUI

struct ExternalWeblinkView: View {
    // MARK: - Properties
    
    let animal: AnimalModel
    
    var body: some View {
        Group {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            }
            .padding(12)
        }
        .background(
            Color.white
                .opacity(0.2)
                .cornerRadius(8)
        )
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
