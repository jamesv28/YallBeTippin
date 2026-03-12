//
//  ReceiptTotalRow.swift
//  YallBeTippin-2
//
//  Created by James Volmert on 3/11/26.
//

import UIKit

class ReceiptTotalRow: UITableViewCell {

    
    @IBOutlet weak var totalLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(total: Double) {
        totalLabel.text = "\(total)"
    }

}
