//
//  NoVideosEmptyState.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/22/21.
//

import SwiftUI

struct NoVideosEmptyState: View {
    var mediaType:String
    var openFilters: () -> Void
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "exclamationmark.circle.fill").scaleEffect(5).padding(.bottom, 20).foregroundColor(.red)
            Text("Sorry no \(mediaType) found, please adjust filters and try again.").font(.title2).padding(.vertical, 20).padding(.horizontal, 20).multilineTextAlignment(.center)
            BastosButton(action: openFilters, title: "Open Filters", backgroundColor: Color.whiteBackground)
            Spacer()
        }
    }
}

struct NoVideosEmptyState_Previews: PreviewProvider {
    static var previews: some View {
        NoVideosEmptyState(mediaType: "Videos", openFilters: test)
    }
}

func test(){
    print("open filters ")
}
