//
//  MenuItem.swift
//  YallBeTippin
//
//  Created by James Volmert on 2/26/26.
//

import Foundation

// structs are similar to classes - but we don't need an initializer
struct MenuItem {
    let name: String
    let price: Double
    let img: String
    var count: Int = 0
}
