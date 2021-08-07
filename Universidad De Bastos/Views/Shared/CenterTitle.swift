//
//  CenterTitle.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/7/21.
//

import SwiftUI

struct CenterTitle: View {
    let title:String
    var body: some View {
        Text(title).font(.title).frame(maxWidth:.infinity)
    }
}

struct CenterTitle_Previews: PreviewProvider {
    static var previews: some View {
        CenterTitle(title:"Videos")
    }
}
