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
    
    var librosData: [LibroModel]? {
        if (libroViewModel.libroData != nil){
            return libroViewModel.libroData
        } else {
            return nil
        }
    }
    
    
    var body: some View {
        VStack {
            CenterTitle(title: "Libros")
            if (libroViewModel.libroData != nil){
                LibroList(libroData: librosData)
            }else{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }.background(Color.primaryGradient.edgesIgnoringSafeArea(.all)).onAppear(perform: getLibros)
       
       
    }
}

struct CentroDeLibrosView_Previews: PreviewProvider {
    static var previews: some View {
        CentroDeLibrosView()
    }
}
