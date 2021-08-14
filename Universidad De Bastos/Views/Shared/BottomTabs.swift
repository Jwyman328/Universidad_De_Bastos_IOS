//
//  BottomTabs.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/14/21.
//

import SwiftUI

struct BottomTabs: View {
    var body: some View {
        TabView {
            CentroDeVideosView().tabItem {
                Image(systemName: "video")
                Text("Videos")
            }
            CentroDeArticulosView().tabItem {
                Image(systemName: "square.and.pencil")
                Text("Articulos")
            }
            CentroDeLibrosView().tabItem {
                Image(systemName: "book")
                Text("Libros")
            }
        }
    }
}

struct BottomTabs_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabs()
    }
}
