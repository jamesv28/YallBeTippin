//
//  ReceiptTipRow.swift
//  YallBeTippin-2
//
//  Created by James Volmert on 3/11/26.
//

import UIKit

class ReceiptTipRow: UITableViewCell {

    @IBOutlet weak var tipLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(tip: TipOptions) {
        tipLabel.text = tip.toString()
    }

}
