//
//  DataModel.swift
//  YallBeTippin
//
//  Created by James Volmert on 2/26/26.
//

import Foundation

class Api {
    static let shared = Api()
    private init() {
        
    }
    
    func fetchData() -> [MenuItem] {
        return [
            MenuItem(name: "Burger", price: 12.5, img: "burger"),
            MenuItem(name: "Enchilada", price: 14.75, img: "enchilada"),
            MenuItem(name: "Hot Wings", price: 16.5, img: "wings"),
            MenuItem(name: "Loaded Fries", price: 9.99, img: "fries"),
            MenuItem(name: "Gyro", price: 22.5, img: "gyro"),
            MenuItem(name: "Tacos", price: 24.5, img: "tacos"),
            MenuItem(name: "Quesadilla", price: 13.25, img: "quesadilla"),
        ]
    }
}
