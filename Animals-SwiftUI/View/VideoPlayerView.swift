//
//  VideoPlayerView.swift
//  Animals-SwiftUI
//
//  Created by Ivan Nikitin on 11.07.2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    // MARK: - Properties
    
    var videoSelected: String
    var videoTitle: String
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            VideoPlayer(player: VideoPlayerHelper.playVideo(
                fileName: videoSelected,
                fileFormat: "mp4")
            )
            //            {
            //                Text(videoTitle) //make like watermark
            //            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                
                ,alignment: .topLeading
            )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static let animalName: String = "lion"
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: animalName, videoTitle: "Lion")
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
