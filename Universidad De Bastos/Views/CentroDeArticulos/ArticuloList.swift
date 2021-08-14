//
//  ArticuloList.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/14/21.
//

import SwiftUI

struct ArticuloList: View {
    var articalData: [ArticuloModel]?
    var body: some View {
        GeometryReader {
            geometry in
            List {
                ForEach(articalData!, id: \.self){
                    (articulo: ArticuloModel) in
                    ArticuloCard(
                             articalURL: articulo.url,
                             title: articulo.title,
                             categories: articulo.categories,
                             author: articulo.author,
                             date: articulo.dateMDY,
                             image: articulo.imageUrl)
                        .padding(7)
                        .frame(height:geometry.size.height / 1.2)
                        .listRowBackground(Color.primaryGradient)
                }
            }
    //                        .refreshable(action: makeRequest)
        }

    }
}

struct ArticuloList_Previews: PreviewProvider {
    static var previews: some View {
        ArticuloList()
    }
}

