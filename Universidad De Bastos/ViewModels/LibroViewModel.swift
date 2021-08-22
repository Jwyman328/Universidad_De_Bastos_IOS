//
//  LibroViewModel.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/14/21.
//

import Foundation

class LibroViewModel: ObservableObject {
    var libroData: [LibroModel]?
    @Published var dataToDisplay: [LibroModel]?
    @Published var isFilterModalShowing = false
    
    var filterOptions : [String : [String]] = [
        "read": ["read", "not read", "todos"],
        "category": ["Todos", "Filosofía política","Economía", "sociology", "fiction", "Derecho"],
        "order" : ["newest", "oldest"]
    ]
    
    @Published var selectedFilters : [String:String] = [
        "read": "todos",
        "category": "todos",
        "order" : "newest"
    ]
    
    func setSelectedFilters(key: String, newValue: String){
        self.selectedFilters[key] = newValue
    }
    
    func sortBooks(){
        self.dataToDisplay = sortData()
    }
    
    func setIsReadBool(isReadString: String) -> Bool{
        if (isReadString == "read"){
            return true
        }else {
            return false
        }
    }
    
    func sortData() -> [LibroModel]?{
        if (self.libroData != nil){
            var newDataToUse:[LibroModel]? = []
            
            let readFilter: Bool = setIsReadBool(isReadString: selectedFilters["read"]!) //hasBeenReadByUser
            let categoryFilter = selectedFilters["category"]!
            var orderFilter = selectedFilters["order"]!
            
            for libro in self.libroData! {
                if(selectedFilters["read"]! != "todos" && libro.hasBeenReadByUser != readFilter){
                    continue
                }
                if (categoryFilter != "todos" && libro.catagories.contains(categoryFilter) != true){
                    continue
                }
                //the item has made it now add it to the list
                newDataToUse?.append(libro)
            }
            //order by date
            if (orderFilter == "newest"){
                return newDataToUse!.sorted(by: { $0.year > $1.year })
            }else {
                return newDataToUse!.sorted(by: { $0.year < $1.year })
            }
        }else {
            return nil
        }
    }
    
 
     func handleGetLibrosSuccess(results: [LibroModel]?){
        self.libroData = results
        self.sortBooks()

    }
    func makeRequest(){
        self.queryService.getLibros()
    }
    
    var queryService: GetLibrosQueryService {
        return GetLibrosQueryService(setLibrosData: self.handleGetLibrosSuccess)
    }
    
   
}
