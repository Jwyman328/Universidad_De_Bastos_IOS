//
//  VideoList.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/7/21.
//

import SwiftUI

struct VideoList: View {
    var videoData: [VideoModel]?
    var body: some View {
        GeometryReader {
            geometry in
            List {
                ForEach(videoData!, id: \.self){
                    (video: VideoModel) in
                    VideoPreview(_id: video._id, categories: video.categories, hasBeenWatchedByUser: video.hasBeenWatchedByUser, image: video.image, noteCount: video.noteCount, title: video.title, videoUrl: video.videoUrl, year: video.year).padding(7).frame(height:geometry.size.height / 1.5).listRowBackground(Color.primaryGradient)
                }
            }
    //                        .refreshable(action: makeRequest)
        }

    }
}

struct VideoList_Previews: PreviewProvider {
    static var previews: some View {
        VideoList()
    }
}
