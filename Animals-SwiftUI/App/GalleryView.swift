//
//  GalleryView.swift
//  Animals-SwiftUI
//
//  Created by Ivan Nikitin on 04.07.2023.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - Properties
    
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    let haprics = UIImpactFeedbackGenerator(style: .medium)
    @State private var selectedAnimal: String = "lion"
    
    //MARK: Simple grid definition
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    //MARK: Efficient grid definition
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)

    //MARK: Dynamic grid layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    // MARK: - Body
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                //MARK: Slider
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { value in
                        gridSwitch()
                    }
                
                //MARK: Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 12) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haprics.impactOccurred()
                            }
                    }
                }
                .animation(.easeIn)
                .onAppear {
                    gridSwitch()
                }
                
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
            .previewDevice("iPhone 14 Pro")
    }
}
