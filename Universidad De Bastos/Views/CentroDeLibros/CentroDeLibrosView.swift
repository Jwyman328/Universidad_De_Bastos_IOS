//
//  CentroDeLibrosView.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/14/21.
//

import SwiftUI

struct CentroDeLibrosView: View {
    @StateObject var libroViewModel = LibroViewModel()
    
    func getLibros(){
        libroViewModel.makeRequest()
    }
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).onAppear(perform: getLibros)
    }
}

struct CentroDeLibrosView_Previews: PreviewProvider {
    static var previews: some View {
        CentroDeLibrosView()
    }
}
