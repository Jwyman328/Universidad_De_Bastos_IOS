//
//  BastosButton.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/22/21.
//

import SwiftUI

//
//  ReadButton.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/14/21.
//

import SwiftUI

struct BastosButton: View {
    let action: () -> Void
    let title: String
    let backgroundColor: Color
    var body: some View {
        Button(action: action, label: {
                Text(title).frame(width: 100, height: 100)
                    .foregroundColor(Color.black)
             
                    .frame(width: 200, height: 50)
                    .background(
                        Capsule()
                            .fill(backgroundColor)
                    )
                    .background(
                        Capsule()
                        .stroke(Color.black,lineWidth:2)
                    )
                            
            }).buttonStyle(BorderlessButtonStyle())
    }
}



struct BastosButton_Previews: PreviewProvider {
    static var previews: some View {
        BastosButton(action: mockAction, title:"test", backgroundColor: Color.red)
    }
}
