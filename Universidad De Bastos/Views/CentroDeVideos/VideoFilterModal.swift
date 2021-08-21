//
//  VideoFilterModal.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/18/21.
//

import SwiftUI

struct VideoFilterModal: View {
    @ObservedObject var videoViewModel : VideoViewModel
    var watchedOptions : [String: [String]] {
        videoViewModel.filterOptions
    }
    
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
                    FilterDropDown(videoViewModel: videoViewModel, filterType: "watched", watchedValue: $watchedValue)
                        .padding(.bottom,15)
                    FilterDropDown(videoViewModel: videoViewModel, filterType: "institution", watchedValue: $institutionValue)
                        .padding(.bottom,15)
                    FilterDropDown(videoViewModel: videoViewModel, filterType: "type", watchedValue: $typeValue)
                        .padding(.bottom,15)
                    FilterDropDown(videoViewModel: videoViewModel, filterType: "year", watchedValue: $yearValue)
                        .padding(.bottom,15)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
          }
          
    }

struct VideoFilterButton: View {
    @State private var showingSheet = false
    @ObservedObject var videoVideoModel : VideoViewModel
    
    func dismiss(){
        showingSheet.toggle()
    }
    
    func show(){
        showingSheet.toggle()
    }

    var body: some View {
        Button(action: show) {
            Image(systemName: "line.horizontal.3.decrease.circle")
                .resizable()
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .sheet(isPresented: $showingSheet) {
            VideoFilterModal(dismiss: dismiss, videoViewModel:videoVideoModel ).padding([.bottom], 100).padding(.horizontal, 15)
        }
    }
}


struct VideoFilterModal_Previews: PreviewProvider {
    static var previews: some View {
        VideoFilterButton(videoVideoModel: VideoViewModel())
    }
}

