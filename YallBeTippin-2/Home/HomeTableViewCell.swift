//
//  HomeTableViewCell.swift
//  YallBeTippin-2
//
//  Created by James Volmert on 3/1/26.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var menuName: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(item: MenuItem) {
        menuName.text = item.name
        priceLabel.text = "\(item.price)"
        imgView.image = UIImage(named: item.img)
    }

}
