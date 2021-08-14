//
//  CentroView.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/7/21.
//

import SwiftUI

struct CentroView: View {
    @ObservedObject var viewModel : VideoViewModel
    var CentroItemsList: ([VideoModel]?) -> VideoList
    //= VideoViewModel()
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
                        CentroItemsList(theData)
                    }
                
                }
                .frame(maxWidth: .infinity)
        }
        .background(Color.primaryGradient.edgesIgnoringSafeArea(.all))
    }
}

//struct CentroView_Previews: PreviewProvider {
//    static var previews: some View {
//        CentroView()
//    }
//}
