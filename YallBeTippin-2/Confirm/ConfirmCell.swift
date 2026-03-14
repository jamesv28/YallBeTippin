//
//  ConfirmCell.swift
//  YallBeTippin-2
//
//  Created by James Volmert on 3/2/26.
//

import UIKit

protocol ConfirmCellDelegate: AnyObject {
    func didAdd(at indexPath: IndexPath)
    
    func didMinus(at indexPath: IndexPath)
}
class ConfirmCell: UITableViewCell {
    weak var delegate: ConfirmCellDelegate?
    var indexPath: IndexPath?

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didTapPlusButton() {
        guard let indexPath else {
            return
        }
        delegate?.didAdd(at: indexPath)
    }
    
    @IBAction func didTapMinusButton() {
        guard let indexPath else {
            return
        }
        delegate?.didMinus(at: indexPath)
    }
    
    func configure(item: MenuItem, indexPath: IndexPath) {
        self.indexPath = indexPath
        nameLabel.text = item.name
        priceLabel.text = item.price.toCurrency()
        imgView.image = UIImage(named: item.img)
        countLabel.text = "\(item.count)"
        
    }
}
