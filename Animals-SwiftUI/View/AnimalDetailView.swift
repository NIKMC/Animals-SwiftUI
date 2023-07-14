//
//  AnimalDetailView.swift
//  Animals-SwiftUI
//
//  Created by Ivan Nikitin on 06.07.2023.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: - Properties
    let animal: AnimalModel
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                //MARK: Headline
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                //MARK: Gallery
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText:"Wilderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                //MARK: Facts
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                //MARK: Description
                
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                //MARK: Map
                
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                
                //MARK: Links
                
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    ExternalWeblinkView(animal: animal)
                    
                }
                .padding(.horizontal)
                
            }
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }
    }
}

// MARK: - Preview
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[1])
        }
        .previewDevice("iPhone 11 Pro")
    }
}
