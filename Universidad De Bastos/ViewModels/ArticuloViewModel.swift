//
//  ArticuloViewModel.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/8/21.
//

import Foundation


class ArticuloViewModel: ObservableObject {
    @Published var articuloData: [ArticuloModel]?
    
    init(){
        articuloData = []
    }
    
    func setArticuloData(newArticuloData: [ArticuloModel]?) -> Void {
        self.articuloData = newArticuloData
    }
    
    func makeRequest(){
        self.queryService.getArticlos()
    }
    
    var queryService: GetArticulosQueryService {
        GetArticulosQueryService(setArticulosData: self.setArticuloData)
    }
}
