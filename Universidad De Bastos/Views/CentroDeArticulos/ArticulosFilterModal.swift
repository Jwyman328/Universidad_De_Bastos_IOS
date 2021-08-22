//
//  ArticulosFilterModal.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/22/21.
//

import SwiftUI

struct ArticulosFilterModal: View {
    @ObservedObject var articuloViewModel : ArticuloViewModel
    @State var orderValue : String
    
    init(dismiss: @escaping () -> Void, articuloViewModel : ArticuloViewModel) {
        self._orderValue = State(initialValue: articuloViewModel.selectedFilters["order"]!)
        self.articuloViewModel = articuloViewModel
        self.dismiss = dismiss
    }

    @State private var showPicker = false
    
    var dismiss: () -> Void
    
    func saveFilter(){
        articuloViewModel.setSelectedFilters(key: "order", newValue: orderValue)
        articuloViewModel.sortArticulos()

        dismiss()
    }
    
    func showDropDown(){
        showPicker.toggle()
    }
    
    
    var body: some View {
        GeometryReader {
            geometry in
                VStack() {
                    HStack {
                        Text("Video Filters").font(.title2)
                        Spacer()
                        Button("Save") {
                            self.saveFilter()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .padding(30)
                    
                ScrollView() {
                    FilterDropDown(filterOptions: articuloViewModel.filterOptions, filterType: "order", selectedValue: $orderValue)
                        .padding(.bottom,15)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
          }
    }}

struct ArticalFilterButton: View {
    @Binding var showingSheet: Bool
    @ObservedObject var articuloViewModel : ArticuloViewModel
    var dismiss: () -> Void
    var show: () -> Void
    

    var body: some View {
        FilterButton(show:show)
        .sheet(isPresented: $showingSheet) {
            ArticulosFilterModal(dismiss: dismiss, articuloViewModel:articuloViewModel ).padding([.bottom], 100).padding(.horizontal, 15)
        }
    }
}

//struct ArticulosFilterModal_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticulosFilterModal()
//    }
//}

