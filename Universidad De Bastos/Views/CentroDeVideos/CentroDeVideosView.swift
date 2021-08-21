//
//  CentroDeVideosView.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 7/25/21.
//

import SwiftUI

struct CentroDeVideosView: View {
    @StateObject var viewModel = VideoViewModel()
    
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

    var body: some View {
        GeometryReader {
            geometry in
                VStack(alignment:.leading) {
                    HStack {
                        CenterTitle(title: "Videos")
                        VideoFilterButton(videoVideoModel: viewModel).padding([.leading, .trailing], 15)
                    }
                   
                    if (theData != nil) {
                        VideoList(videoData: theData)
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




