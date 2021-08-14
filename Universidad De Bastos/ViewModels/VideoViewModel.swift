//
//  VideoViewModel.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 7/31/21.
//

import Foundation

class VideoViewModel: ObservableObject {
    @Published var dataToUse: [VideoModel]?
 
     func handleGetVideosSuccess(results: [VideoModel]?){
        self.dataToUse = results
    }
    func makeRequest(){
        self.queryService.getVideos()
    }
    
    var queryService: QueryService {
        return QueryService(handleGetVideoSuccess: self.handleGetVideosSuccess)
    }
    
   
}
