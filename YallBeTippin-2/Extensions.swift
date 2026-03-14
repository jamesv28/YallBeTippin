//
//  Extensions.swift
//  YallBeTippin-2
//
//  Created by James Volmert on 3/11/26.
//

import UIKit

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

extension Double {
    func toCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        let value = NSNumber(value: self)
        let str = formatter.string(from: value)
        return str ?? "N/A"
    }
}

extension UIViewController {
   func pushVC(_ vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
