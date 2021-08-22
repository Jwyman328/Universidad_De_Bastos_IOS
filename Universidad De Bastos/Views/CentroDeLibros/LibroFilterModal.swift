//
//  LibroFilterModal.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/22/21.
//

import SwiftUI

struct LibroFilterModal: View {
    @ObservedObject var libroViewModel : LibroViewModel
    @State var orderValue : String
    @State var categoryValue : String
    @State var readValue : String
    
    init(dismiss: @escaping () -> Void, libroViewModel : LibroViewModel) {
        self._orderValue = State(initialValue: libroViewModel.selectedFilters["order"]!)
        self._categoryValue = State(initialValue: libroViewModel.selectedFilters["category"]!)
        self._readValue = State(initialValue: libroViewModel.selectedFilters["read"]!)

        self.libroViewModel = libroViewModel
        self.dismiss = dismiss
    }

    @State private var showPicker = false
    
    var dismiss: () -> Void
    
    func saveFilter(){
        libroViewModel.setSelectedFilters(key: "order", newValue: orderValue)
        libroViewModel.setSelectedFilters(key: "read", newValue: readValue)
        libroViewModel.setSelectedFilters(key: "category", newValue: categoryValue)

        libroViewModel.sortBooks()

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
                    FilterDropDown(filterOptions: libroViewModel.filterOptions, filterType: "order", selectedValue: $orderValue)
                        .padding(.bottom,15)
                    FilterDropDown(filterOptions: libroViewModel.filterOptions, filterType: "read", selectedValue: $readValue)
                        .padding(.bottom,15)
                    FilterDropDown(filterOptions: libroViewModel.filterOptions, filterType: "category", selectedValue: $categoryValue)
                        .padding(.bottom,15)
                } .frame(width: geometry.size.width, height: geometry.size.height)
            }
          }
    }
}


struct LibroFilterButton: View {
    @Binding var showingSheet: Bool
    @ObservedObject var libroViewModel : LibroViewModel
    var dismiss: () -> Void
    var show: () -> Void
    

    var body: some View {
        FilterButton(show:show)
        .sheet(isPresented: $showingSheet) {
            LibroFilterModal(dismiss: dismiss, libroViewModel:libroViewModel ).padding([.bottom], 100).padding(.horizontal, 15)
        }
    }
}


//struct LibroFilterModal_Previews: PreviewProvider {
//    static var previews: some View {
//        LibroFilterModal()
//    }
//}
