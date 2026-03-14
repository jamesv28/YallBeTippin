//
//  ReceiptRow.swift
//  YallBeTippin-2
//
//  Created by James Volmert on 3/12/26.
//

import UIKit

class ReceiptRow: UITableViewCell {

    //    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var countLabel: UILabel!
//    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(item: MenuItem) {
        nameLabel.text = item.name
        countLabel.text = "\(item.count)"
        let double = Double(item.count)
        let total = item.price * double
        priceLabel.text = total.toCurrency()
    }
}
