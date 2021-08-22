//
//  FilterButton.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/22/21.
//

import SwiftUI

struct FilterButton: View {
    var show:() -> Void
    var body: some View {
        Button(action: show) {
            Image(systemName: "line.horizontal.3.decrease.circle")
                .resizable()
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterButton(show: test)
    }
}
