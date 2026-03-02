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
    
    
    @IBOutlet weak var orderCountStackView: UIStackView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var subtractButton: UIButton!
    
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
        countLabel.text = "\(item.count)"
        if item.count > 0 {
            orderCountStackView.isHidden = false
        } else {
            orderCountStackView.isHidden = true
        }
    }
    
    
    @IBAction func didTapPlusButton() {
        
    }
    
    
    @IBAction func didTapMinusButton() {
        
    }
    
}
