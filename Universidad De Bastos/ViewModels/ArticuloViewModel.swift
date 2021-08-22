//
//  ArticuloViewModel.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/8/21.
//

import Foundation


class ArticuloViewModel: ObservableObject {
    var articuloData: [ArticuloModel]?
    @Published var dataToDisplay: [ArticuloModel]?
    @Published var isFilterModalShowing = false

    var filterOptions : [String : [String]] = [
        "order": ["newest", "oldest"]
    ]
    
    @Published var selectedFilters : [String:String] = [
        "order": "oldest",
    ]
    
    func setSelectedFilters(key: String, newValue: String){
        self.selectedFilters[key] = newValue
    }
    
    func sortArticulos(){
        self.dataToDisplay = sortData()
    }
    
    func sortData() -> [ArticuloModel]?{
        if (selectedFilters["order"] == "newest"){
            return articuloData!.sorted(by: { $0.getDateValueFromdateMDY() > $1.getDateValueFromdateMDY() })
        }else {
            return articuloData!.sorted(by: { $0.getDateValueFromdateMDY() < $1.getDateValueFromdateMDY() })
        }

    }
   

    
    init(){
        articuloData = []
        dataToDisplay = []
    }
    
    func setArticuloData(newArticuloData: [ArticuloModel]?) -> Void {
        self.articuloData = newArticuloData
        self.sortArticulos()
    }
    
    func makeRequest(){
        self.queryService.getArticlos()
    }
    
    var queryService: GetArticulosQueryService {
        GetArticulosQueryService(setArticulosData: self.setArticuloData)
    }
}
