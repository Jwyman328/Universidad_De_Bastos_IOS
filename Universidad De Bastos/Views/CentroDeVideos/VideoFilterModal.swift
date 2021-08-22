//
//  VideoFilterModal.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/18/21.
//

import SwiftUI

struct VideoFilterModal: View {
    @ObservedObject var videoViewModel : VideoViewModel

    @State var watchedValue : String
    @State var institutionValue : String
    @State var typeValue : String
    @State var yearValue : String

    
    init(dismiss: @escaping () -> Void, videoViewModel: VideoViewModel) {
        self._watchedValue =
            State(initialValue: videoViewModel.selectedFilters["watched"]!)
        self._institutionValue =  State(initialValue: videoViewModel.selectedFilters["institution"]!)
        self._typeValue =  State(initialValue: videoViewModel.selectedFilters["type"]!)
        self._yearValue = State(initialValue: videoViewModel.selectedFilters["year"]!)
        self.videoViewModel = videoViewModel
        self.dismiss = dismiss
    }

    @State private var showPicker = false
    
    var dismiss: () -> Void
    
    func saveFilter(){
        videoViewModel.setSelectedFilters(key: "watched", newValue: watchedValue)
        videoViewModel.setSelectedFilters(key: "institution", newValue: institutionValue)
        videoViewModel.setSelectedFilters(key: "type", newValue: typeValue)
        videoViewModel.setSelectedFilters(key: "year", newValue: yearValue)
        videoViewModel.sortVideos()

        dismiss()
    }
    
    func showDropDown(){
        showPicker.toggle()
    }
    
    var dropDownImage:String {
        if (showPicker){
            return  "arrow.down.circle"
        }else {
            return "arrow.left.circle"
        }
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
                    FilterDropDown(filterOptions: videoViewModel.filterOptions, filterType: "watched", selectedValue: $watchedValue)
                        .padding(.bottom,15)
                    FilterDropDown(filterOptions: videoViewModel.filterOptions, filterType: "institution", selectedValue: $institutionValue)
                        .padding(.bottom,15)
                    FilterDropDown(filterOptions: videoViewModel.filterOptions, filterType: "type", selectedValue: $typeValue)
                        .padding(.bottom,15)
                    FilterDropDown(filterOptions: videoViewModel.filterOptions, filterType: "year", selectedValue: $yearValue)
                        .padding(.bottom,15)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
          }
          
    }

struct VideoFilterButton: View {
    @Binding var showingSheet: Bool
    @ObservedObject var videoVideoModel : VideoViewModel
    var dismiss: () -> Void
    var show: () -> Void
    

    var body: some View {
        FilterButton(show:show)
        .sheet(isPresented: $showingSheet) {
            VideoFilterModal(dismiss: dismiss, videoViewModel:videoVideoModel ).padding([.bottom], 100).padding(.horizontal, 15)
        }
    }
}


//struct VideoFilterModal_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoFilterButton(videoVideoModel: VideoViewModel())
//    }
//}

