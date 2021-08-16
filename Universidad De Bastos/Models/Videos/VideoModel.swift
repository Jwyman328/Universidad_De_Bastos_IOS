//
//  VideoModel.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 7/25/21.
//

import Foundation

struct VideoModel: Codable, Hashable {
    
    
    var _id: String
    var categories:[String]
    var hasBeenWatchedByUser: Bool
    var image: String
    var noteCount: Int
    var title: String
    var videoUrl: String
    var year: Int

}

extension VideoModel:Identifiable {
    var id: UUID { return UUID() }

}
