//
//  DataViewModel.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/22/21.
//

import Foundation

protocol DataViewModel: ObservableObject {
    var filterOptions: [String : [String]] { get set }
}
