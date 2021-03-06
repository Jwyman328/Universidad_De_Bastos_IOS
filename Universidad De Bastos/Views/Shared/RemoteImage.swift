//
//  RemoteImage.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/1/21.
//

import SwiftUI
import URLImage

struct RemoteImage: View {
    let imageItem : URL?
    
    var body: some View {
        if (imageItem != nil){
            URLImage(imageItem!,
                     empty: {
                        EmptyView()
                     },
                     inProgress: { progress in
                        Image(systemName: "loading")
                     },
                     failure: { error, retry in
                        EmptyView()
                     },
                     content: { image, info in
                        image
                            .resizable()
                     })
        }
    }
}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(imageItem: imageItem!)
    }
}

let imageItem =  URL(string: "data:image/png;base64,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")


