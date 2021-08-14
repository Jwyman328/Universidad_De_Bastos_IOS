//
//  ArticuloCard.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/10/21.
//

import SwiftUI



struct ArticuloCard: View {
    let articalURL: String
    let title:String
    let categories: [String]
    let author: String
    let date : String
    let image: String
    
    var imageURL:  URL?  {
        URL(string:image)
    }
    
    var articalUrl: URL? {
        URL(string:articalURL)
    }
    
    var categoriesDisplayText: String {
        var categoryText = "Categories: "
        for (index, category) in categories.enumerated() {
            if (index != 0){
                categoryText = categoryText + ", " + category
            }else {
                categoryText = categoryText + category
            }
        }
        return categoryText
    }
    func openWebView(){
        UIApplication.shared.open(articalUrl!)
        print("web view opened")
    }
    var body: some View {
       
        GeometryReader {
            geometry in
                VStack(alignment:.leading) {
                    RemoteImage(imageItem: imageURL)
                        .frame(width: geometry.size.width, height: geometry.size.height / 3, alignment: .trailing)
                        .cornerRadius(CardStyles.CardRadius)
                    Text(title)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom, 2)
                    Text(author)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom, 2)
                    Text(date)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom, 2)
                    Text(categoriesDisplayText)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom, 2)

                    ReadButton(action: openWebView, title: "Leer")
                        .frame(maxWidth: .infinity, alignment:.center)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom, 15)
                }
                .background(Color.whiteBackground).cornerRadius(CardStyles.CardRadius).addHasorHasNotBeenViewedBorder(hasBeenWatchedByUser: true)
                
                //.padding()
//                .frame(width: geometry.size.width, height:  geometry.size.height / 5)
            
 
        }

        
    }
}

struct ArticuloCard_Previews: PreviewProvider {
    static var previews: some View {
        ArticuloCard(articalURL: ArticalModelDataMock.url, title: ArticalModelDataMock.title, categories: ArticalModelDataMock.categories, author: ArticalModelDataMock.author, date: ArticalModelDataMock.date, image: ArticalModelDataMock.imageUrl)
    }
}


