//
//  VideoViewModel.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 7/31/21.
//

import Foundation

class VideoViewModel: ObservableObject {
    @Published var dataToUse: [VideoModel]?
    @Published var dataToDisplay: [VideoModel]?
    
    var selectedFilters : [String:String] = [
        "institution": "todos",
        "type": "todos",
        "watched": "todos",
        "year": "todos"
    ]
 
     func handleGetVideosSuccess(results: [VideoModel]?){
        self.dataToUse = results
        sortData()
    }
    func makeRequest(){
        self.queryService.getVideos()
    }
    
    func sortData() -> [VideoModel]?{
        //only put in things that are of the selected filters
        if (dataToUse != nil){
            var newDataToUse:[VideoModel]? = []
//            guard dataToUse != nil else {
//                return nil
//            }
            
            let institutionFilter = selectedFilters["institution"]!
            let typeFilter = selectedFilters["type"]!
            let watchedFilter = selectedFilters["watched"]!
            let yearFilter = selectedFilters["year"]!
            
            for video in dataToUse! {
                print("here is a vid", institutionFilter)
                if(institutionFilter != "todos" || video.categories.contains(institutionFilter)){
                    continue
                }
                if (typeFilter != "todos" || video.categories.contains(typeFilter)){
                    continue
                }
                if (watchedFilter != "todos" || setWatchedValue(watchedValue: watchedFilter) != video.hasBeenWatchedByUser){
                    continue
                }
                if (yearFilter != "todos" && yearFilter != String(video.year)){
                    continue
                }
                //the item has made it now add it to the list
                print("appending this", video.year)
                newDataToUse?.append(video)
            }
//            print("filtered data", video.year)
            return newDataToUse
        }else {
            return nil
        }

        
    }
    
    func setWatchedValue(watchedValue: String) -> Bool{
        // todos, watched, not watched
        if(watchedValue == "watched"){
            return true
        }else {
            return false
        }
    }
    
    var queryService: QueryService {
        return QueryService(handleGetVideoSuccess: self.handleGetVideosSuccess)
    }
    
   
}
