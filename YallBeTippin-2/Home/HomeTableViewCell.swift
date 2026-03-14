//
//  HomeTableViewCell.swift
//  YallBeTippin-2
//
//  Created by James Volmert on 3/1/26.
//

import UIKit

protocol HomeTableViewCellDelegate: AnyObject {
    func didAdd(at indexPath: IndexPath)
    
    func didMinus(at indexPath: IndexPath)
}

class HomeTableViewCell: UITableViewCell {

    weak var delegate: HomeTableViewCellDelegate?
    private var indexPath: IndexPath?
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var menuName: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    
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
    
    func configure(item: MenuItem, indexPath: IndexPath) {
        self.indexPath = indexPath
        menuName.text = item.name
        priceLabel.text = item.price.toCurrency()
        imgView.image = UIImage(named: item.img)
        countLabel.text = "\(item.count)"
        if item.count > 0 {
            orderCountStackView.isHidden = false
        } else {
            orderCountStackView.isHidden = true
        }
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
    
}
