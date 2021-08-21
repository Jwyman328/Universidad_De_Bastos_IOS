//
//  VideoViewModel.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 7/31/21.
//

import Foundation

class VideoViewModel: ObservableObject {
    @Published var allVideoData: [VideoModel]?
    @Published var dataToDisplay: [VideoModel]?
    @Published var isFilterModalShowing = false
    
    func dismissFilterModal(){
        isFilterModalShowing = false
    }
    
    func showFilterModal(){
        isFilterModalShowing = true
    }
    
    @Published var selectedWatched = "todos"
    
    @Published var filterOptions : [String : [String]] = [
        "institution": ["todos","juanDeMariana", "UFM", "xoanDeLugo"],//
        "type": ["todos", "interview", "conference"],
        "watched": ["todos", "watched", "not watched"],
        "year": ["todos", "2012", "2013","2014","2015", "2016", "2017", "2018", "2019", "2020"]
    ]
    
    @Published var selectedFilters : [String:String] = [
        "institution": "todos",
        "type": "todos",
        "watched": "todos",
        "year": "todos"
    ]
    
    func setSelectedFilters(key: String, newValue: String){
        print("key value", key, newValue)
        self.selectedFilters[key] = newValue
    }
   
 
     func handleGetVideosSuccess(results: [VideoModel]?){
        self.allVideoData = results
        self.sortVideos()
    }
    func makeRequest(){
        self.queryService.getVideos()
    }
    
    func sortVideos(){
        self.dataToDisplay = sortData()
    }
    
    func sortData() -> [VideoModel]?{
        //only put in things that are of the selected filters
        if (self.allVideoData != nil){
            var newDataToUse:[VideoModel]? = []
            let institutionFilter = selectedFilters["institution"]!
            let typeFilter = selectedFilters["type"]!
            let watchedFilter = selectedFilters["watched"]!
            let yearFilter = selectedFilters["year"]!
            
            for video in self.allVideoData! {
                print("here is a vid", institutionFilter)
                
 
                if(institutionFilter != "todos" && video.categories.contains(institutionFilter) != true){
                    continue
                }
                if (typeFilter != "todos" && video.categories.contains(typeFilter) != true){
                    continue
                }
                if (watchedFilter != "todos" && (setWatchedValue(watchedValue: watchedFilter) != video.hasBeenWatchedByUser)){
                    continue
                }
                if (yearFilter != "todos" && yearFilter != String(video.year)){
                    continue
                }
                //the item has made it now add it to the list
                newDataToUse?.append(video)
            }
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
