//
//  LibroCard.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/15/21.
//

import SwiftUI

struct LibroCard: View {
    var _id: String
    var title:String
    var image: String
    var catagories: [String]
    var author: String
    var locationLink: String
    var hasBeenReadByUser: Bool
    var year: Int
    
    var imageURL:  URL?  {
        URL(string:image)
    }
    
    var isFront = true //make on touch switch
    
    var body: some View {
        GeometryReader {
            geometry in
            VStack(alignment: .center) {
                if (isFront){
                    RemoteImage(imageItem: imageURL)

                }else {
                    Text(title).font(.title)
                        .frame(maxHeight: .infinity).padding([.leading, .trailing], 15)
                    Text(author).font(.title2)
                        .frame(maxHeight: .infinity).padding([.leading, .trailing], 15)
                    IsReadButton(bookId: _id, isRead: hasBeenReadByUser)
                    GetBookButton(bookSite: locationLink)
                        .frame(maxHeight: .infinity)
                }
            }.frame(width: geometry.size.width, alignment: .top).addHasorHasNotBeenReadBorder(hasBeenReadByUser: hasBeenReadByUser)

        }

        
    }
}

extension View {
    func addHasorHasNotBeenReadBorder(hasBeenReadByUser:Bool) -> some View {
        var borderColor: Color {
            if (hasBeenReadByUser){
                return Color.hasReadYellow
            }else {
                return Color.lightGray
            }
        }
        return self.overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(borderColor, lineWidth: 10)
        ).background(Color.bastosBlue)
    }
}

struct LibroCard_Previews: PreviewProvider {
    static var previews: some View {
        LibroCard(_id: LibroMock._id, title: LibroMock.title, image: LibroMock.image, catagories: LibroMock.catagories, author: LibroMock.author, locationLink: LibroMock.locationLink, hasBeenReadByUser: LibroMock.hasBeenReadByUser, year: LibroMock.year)
    }
}
