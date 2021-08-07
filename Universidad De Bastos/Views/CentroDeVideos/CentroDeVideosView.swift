//
//  CentroDeVideosView.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 7/25/21.
//

import SwiftUI

struct CentroDeVideosView: View {
    @StateObject var viewModel = VideoViewModel()
//    var testViewModel: VideoModel

    func makeRequest(){
        viewModel.makeRequest()
    }
    var theData: [VideoModel]? {
        if ((viewModel.dataToUse) != nil){
            return
                viewModel.dataToUse!
        }else {
            return nil
        }
    }

    var body: some View {
        GeometryReader {
            geometry in
                VStack(alignment:.leading) {
                    CenterTitle(title: "Videos")
                     Button("makeRequest", action:makeRequest)
                    if (theData != nil) {
                        VideoList(videoData: theData)
                    }
                
                }
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




