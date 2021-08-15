//
//  LibroList.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/15/21.
//

import SwiftUI

struct LibroList: View {
    var libroData: [LibroModel]?
    var body: some View {
        GeometryReader {
            geometry in
            List {
                ForEach(libroData!, id: \.self){
                    (libro: LibroModel) in
                    LibroCard(_id: libro._id, title: libro.title, image: libro.image, catagories: libro.catagories, author: libro.author, locationLink: libro.locationLink, hasBeenReadByUser: libro.hasBeenReadByUser, year: libro.year)
                        .padding(7)
                        .frame(height:geometry.size.height / 1.5)
                        .listRowBackground(Color.primaryGradient)
                }
            }
    //                        .refreshable(action: makeRequest)
        }

    }
}

struct LibroList_Previews: PreviewProvider {
    static var previews: some View {
        LibroList()
    }
}
