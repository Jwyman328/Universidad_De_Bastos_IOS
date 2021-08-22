//
//  LibroModel.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/14/21.
//

import Foundation


struct LibroModel: Codable, Hashable {
    var _id: String
    var title:String
    var image: String
    var catagories: [String]
    var author: String
    var locationLink: String
    var hasBeenReadByUser: Bool
    var year: Int

}

extension LibroModel:Identifiable {
    var id: UUID { return UUID() }
    

}
