//
//  IsReadButton.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/15/21.
//

import SwiftUI

struct IsReadButton: View {
    let bookId: String
    let isRead: Bool
    
    var title : String {
        if (isRead){
            return "No leido?"
        }else{
            return "Leido"
        }
    }
    
    func setReadStatus(){
        //http request
        // change read status
        print("hit set read status")
    }
    
    var fillColor: Color {
        if (isRead){
            return Color.hasReadYellow
        }else {
            return Color.whiteBackground
        }
    }
    
    var body: some View {
        Button(action: setReadStatus, label: {
                Text(title).frame(width: 100, height: 100)
                    .foregroundColor(Color.black)
             
                    .frame(width: 200, height: 50)
                    .background(
                        Capsule()
                            .fill(fillColor)
                    )
                    .background(
                        Capsule()
                        .stroke(Color.black,lineWidth:2)
                    )
                            
            }).buttonStyle(BorderlessButtonStyle())
    }
}

struct IsReadButton_Previews: PreviewProvider {
    static var previews: some View {
        IsReadButton(bookId: LibroMock._id, isRead: LibroMock.hasBeenReadByUser)
    }
}
