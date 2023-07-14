//
//  InsetFactView.swift
//  Animals-SwiftUI
//
//  Created by Ivan Nikitin on 10.07.2023.
//

import SwiftUI

struct InsetFactView: View {
    
    // MARK: - Properties
    let animal: AnimalModel
    
    // MARK: - Body
    
    var body: some View {
        
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
