//
//  CentroDeVideosView.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 7/25/21.
//

import SwiftUI

struct CentroDeVideosView: View {
    @StateObject var viewModel = VideoViewModel()
    @State private var showingSheet = false

    
    func makeRequest(){
        if (theData == nil){
            viewModel.makeRequest()
        }
    }
    
    var theData: [VideoModel]? {
        if ((viewModel.dataToDisplay) != nil && viewModel.dataToDisplay != []){
            return
                viewModel.dataToDisplay!
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
                VStack(alignment:.leading) {
                    HStack {
                        CenterTitle(title: "Videos")
                        VideoFilterButton(showingSheet: $showingSheet, videoVideoModel: viewModel, dismiss: dismissFilterModal, show: showFilterModal).padding([.leading, .trailing], 15)
                    }
                   
                    if (theData != nil) {
                        VideoList(videoData: theData)
                    }else {
                        NoVideosEmptyState(mediaType: "Videos", openFilters: showFilterModal)
                    }
                }
                .onAppear(perform: makeRequest)
                .frame(maxWidth: .infinity)
        }
        .background(Color.primaryGradient.edgesIgnoringSafeArea(.all))
    }}

struct CentroDeVideosView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView(testViewModel: VideoModelDataMock)
        ContentView()
    }
}


//
//  ContentView.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 7/25/21.
//

import SwiftUI




