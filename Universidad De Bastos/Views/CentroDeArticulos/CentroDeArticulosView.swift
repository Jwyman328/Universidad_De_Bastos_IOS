//
//  CentroDeArticulosView.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/7/21.
//

import SwiftUI

struct CentroDeArticulosView: View {
    @StateObject var articuloViewModel = ArticuloViewModel()
    @State private var showingSheet = false
    
    func getArticulos() -> Void{
        if (theData == nil){
            self.articuloViewModel.makeRequest()
        }
        
    }
    
    var theData:[ArticuloModel]? {
        if (articuloViewModel.dataToDisplay != []){
            return articuloViewModel.dataToDisplay!
        }else {
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
        GeometryReader {
            geometry in
            VStack {
                HStack {
                    CenterTitle(title: "Articulos")
                    ArticalFilterButton(showingSheet: $showingSheet, articuloViewModel: articuloViewModel, dismiss: dismissFilterModal, show: showFilterModal).padding([.leading, .trailing], 15)
                }
                
                if (theData != nil){
                    ArticuloList(articalData: theData)
                }
            }
            .frame(maxWidth: .infinity)
            .onAppear(perform: getArticulos)
        }.background(Color.primaryGradient.edgesIgnoringSafeArea(.all))
    }
}

struct CentroDeArticulosView_Previews: PreviewProvider {
    static var previews: some View {
        CentroDeArticulosView()
    }
}
