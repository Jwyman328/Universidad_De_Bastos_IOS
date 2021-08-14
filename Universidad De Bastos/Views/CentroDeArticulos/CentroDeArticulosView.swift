//
//  CentroDeArticulosView.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/7/21.
//

import SwiftUI

struct CentroDeArticulosView: View {
    @StateObject var articuloViewModel = ArticuloViewModel()
    
    func getArticulos() -> Void{
        if (theData == nil){
            self.articuloViewModel.makeRequest()
        }
        
    }
    
    var theData:[ArticuloModel]? {
//        print("the val",articuloViewModel.articuloData)
        if (articuloViewModel.articuloData != []){
            return articuloViewModel.articuloData!
        }else {
            return nil
        }
    }
    
    var body: some View {
        GeometryReader {
            geometry in
            VStack {
                CenterTitle(title: "Articulos")
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
