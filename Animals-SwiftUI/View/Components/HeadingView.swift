//
//  HeadingView.swift
//  Animals-SwiftUI
//
//  Created by Ivan Nikitin on 06.07.2023.
//

import SwiftUI

struct HeadingView: View {
    
    var headingImage: String
    var headingText: String
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
