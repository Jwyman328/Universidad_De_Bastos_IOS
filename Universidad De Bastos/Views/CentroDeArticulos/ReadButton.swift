//
//  ReadButton.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/14/21.
//

import SwiftUI

struct ReadButton: View {
    let action: () -> Void
    let title: String
    var body: some View {
        Button(action: action, label: {
                Text(title).frame(width: 100, height: 100)
                    .foregroundColor(Color.black)
             
                    .frame(width: 200, height: 50)
                    .background(
                        Capsule()
                            .fill(Color.hasReadYellow)
                    )
                    .background(
                        Capsule()
                        .stroke(Color.black,lineWidth:2)
                    )
                            
            }).buttonStyle(BorderlessButtonStyle())
    }
}

func mockAction(){
    print("action hit")
}

struct ReadButton_Previews: PreviewProvider {
    static var previews: some View {
        ReadButton(action: mockAction, title:"test")
    }
}


