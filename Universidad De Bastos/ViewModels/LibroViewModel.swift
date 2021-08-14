//
//  LibroViewModel.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/14/21.
//

import Foundation

class LibroViewModel: ObservableObject {
    @Published var libroData: [LibroModel]?
 
     func handleGetLibrosSuccess(results: [LibroModel]?){
        print("what are results of libros", results![0].title)
        self.libroData = results
    }
    func makeRequest(){
        self.queryService.getLibros()
    }
    
    var queryService: GetLibrosQueryService {
        return GetLibrosQueryService(setLibrosData: self.handleGetLibrosSuccess)
    }
    
   
}
