//
//  FilterDropDown.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/21/21.
//

import SwiftUI

struct FilterDropDown: View {
    @State private var showPicker = false
    @Binding var selectedValue: String
    let filterType : String
    let filterOptions :  [String : [String]]

    
    init( filterOptions:  [String : [String]], filterType: String, selectedValue: Binding<String>) {
        self.filterOptions = filterOptions
        self.filterType = filterType
        self._selectedValue = selectedValue
    }
    
    func showDropDown(){
        showPicker.toggle()
    }
    
    var dropDownImage:String {
        if (showPicker){
            return  "arrow.down.circle"
        }else {
            return "arrow.left.circle"
        }
    }

    var body: some View {
        VStack {
            Text(filterType.capitalizingFirstLetter()).font(.title2).frame(maxWidth:.infinity, alignment: .leading).foregroundColor(.lightGray)
            Button(action: showDropDown) {
                HStack{
                    Text(selectedValue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: dropDownImage)
                }.padding(.horizontal, 15)
            }
            .padding([.vertical],15)
            .border(Color.gray, width: 1)
            
            if (showPicker){
                Picker(
                    "Please choose a color", selection: $selectedValue)
                        {
                    ForEach(filterOptions[filterType]!, id: \.self) {
                        Text($0).frame(maxWidth: .infinity)
                               }
                }
            }
           
        }
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
