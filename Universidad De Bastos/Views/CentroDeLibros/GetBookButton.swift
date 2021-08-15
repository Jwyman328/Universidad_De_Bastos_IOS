//
//  GetBookButton.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/15/21.
//

import SwiftUI

struct GetBookButton: View {
    let bookSite: String
    
    var bookSiteURL: URL? {
        URL(string:bookSite)
    }
    
    func visitSite(){
        UIApplication.shared.open(bookSiteURL!)

    }

    var body: some View {
        Button(action: visitSite, label: {
            Image(systemName: "arrow.right").scaleEffect(2)
//                .frame(width: 100, height: 100)
                    .foregroundColor(Color.black)
                   
            }).buttonStyle(BorderlessButtonStyle())
    }
}

struct GetBookButton_Previews: PreviewProvider {
    static var previews: some View {
        GetBookButton(bookSite: LibroMock.locationLink)
    }
}
