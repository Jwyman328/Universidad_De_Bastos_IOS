//
//  VideoPreview.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 7/31/21.
//

import SwiftUI
import AsyncImage
import URLImage

struct VideoPreview: View {
    let _id: String
    let categories:[String]?
    let hasBeenWatchedByUser: Bool
    let image: String
    let noteCount: Int
    let title: String
    let videoUrl: String
    let year: Int
    
    var imageURL:  URL?  {
        URL(string:image)
    }
    
    var borderColor: Color {
        if (hasBeenWatchedByUser){
            return Color.yellow
        }else {
            return Color.white
        }
    }
    

    var body: some View {
        GeometryReader {
            geometry in
            VStack(alignment:.center){
                RemoteImage(imageItem: imageURL)
                    .frame(width: geometry.size.width, height: geometry.size.height / 2, alignment: .trailing).cornerRadius(CardStyles.CardRadius)

                Spacer()
                HStack {
                    Text(title).font(.title2)
                        .frame( alignment: .leading)
                }
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding()
                Spacer()
                
            }
            .background(Color.whiteBackground)
            .cornerRadius(CardStyles.CardRadius)
            .addHasorHasNotBeenViewedBorder(hasBeenWatchedByUser: hasBeenWatchedByUser)
        }
  
    }
}

extension View {
    func addHasorHasNotBeenViewedBorder(hasBeenWatchedByUser:Bool) -> some View {
        var borderColor: Color {
            if (hasBeenWatchedByUser){
                return Color.hasReadYellow
            }else {
                return Color.white
            }
        }
        return self.overlay(
            RoundedRectangle(cornerRadius: CardStyles.CardRadius)
                .stroke(borderColor, lineWidth: 10)
        )
    }
}

struct VideoPreview_Previews: PreviewProvider {
    
    static var previews: some View {
        VideoPreview(_id: "1", categories: ["fun","no fun"], hasBeenWatchedByUser: false, image: "img", noteCount: 5, title: "test title", videoUrl: "http", year: 1999)
    }
}
