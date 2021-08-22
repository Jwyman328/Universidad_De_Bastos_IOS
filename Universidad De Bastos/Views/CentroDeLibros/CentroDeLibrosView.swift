//
//  CentroDeLibrosView.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/14/21.
//

import SwiftUI

struct CentroDeLibrosView: View {
    @StateObject var libroViewModel = LibroViewModel()
    @State private var showingSheet = false
    
    func getLibros(){
        libroViewModel.makeRequest()
    }
    
    var librosData: [LibroModel]? {
        if (libroViewModel.dataToDisplay != nil && libroViewModel.dataToDisplay! != []){
            return libroViewModel.dataToDisplay
        } else {
            return nil
        }
    }
    
    func dismissFilterModal(){
        showingSheet.toggle()
    }
    
    func showFilterModal(){
        showingSheet.toggle()
    }
    
    
    var body: some View {
        VStack {
            HStack {
                CenterTitle(title: "Libros")
                LibroFilterButton(showingSheet: $showingSheet, libroViewModel: libroViewModel, dismiss: dismissFilterModal, show: showFilterModal).padding([.leading, .trailing], 15)
            }
            if (librosData != nil){
                LibroList(libroData: librosData)
            }else{
                NoDataEmptyState(mediaType: "Libros", openFilters: showFilterModal)

            }
        }.background(Color.primaryGradient.edgesIgnoringSafeArea(.all)).onAppear(perform: getLibros)
       
       
    }
}

struct CentroDeLibrosView_Previews: PreviewProvider {
    static var previews: some View {
        CentroDeLibrosView()
    }
}
