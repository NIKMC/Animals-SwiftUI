//
//  MotionAnimationView.swift
//  Animals-SwiftUI
//
//  Created by Ivan Nikitin on 12.07.2023.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - Properties
    @State private var randomCircle: Int = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    // MARK: - Functions
    
    func randomCoordinate(maxValue: Double) -> CGFloat {
        return CGFloat.random(in: 0...maxValue)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(x: randomCoordinate(
                            maxValue: geometry.size.width),
                                  y: randomCoordinate(
                                    maxValue: geometry.size.height))
                    //Deprecated
                    //                        .animation(
                    //                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5).repeatForever()
                    //                                .speed(2)
                    //                                .delay(1)
                    //                        )
                        .onAppear(perform: {
                            withAnimation (
                                .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                            ) {
                                isAnimating = true
                            }
                        })
                }
            }
            .drawingGroup()
        }
    }
}

struct MotionAnimation_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
        
    }
}
