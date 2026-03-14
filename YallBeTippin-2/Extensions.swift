//
//  Extensions.swift
//  YallBeTippin-2
//
//  Created by James Volmert on 3/11/26.
//

import Foundation

extension [MenuItem] {
    func calculateTotal(tip: TipOptions) -> Double {
        var total: Double = 0
        self.forEach { item in
            let count = Double(item.count)
            let sum = count * item.price
            total += sum
        }
        return total * tip.rawValue
    }
}
