//
//  AddTipViewController.swift
//  YallBeTippin-2
//
//  Created by James Volmert on 3/8/26.
//

import UIKit

class AddTipViewController: UIViewController {

    @IBOutlet weak var smallTipButton: UIButton!
    @IBOutlet weak var mediumTipButton: UIButton!
    @IBOutlet weak var largeTipButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    lazy var tipSelection: [UIButton] = [
        smallTipButton, mediumTipButton, largeTipButton, skipButton
    ]
    
    @IBOutlet weak var stackView: UIStackView!
    
    lazy var barButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Submit",
            style: .plain,
            target: self,
            action: #selector(didTapBurButton)
        )
        return button
    }()
    
    var tipOptions: TipOptions = .small
    let items: [MenuItem]
    
    init(coder: NSCoder, items: [MenuItem]) {
        self.items = items
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = barButton
        smallTipButton.isSelected = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        let orientation = UIDevice.current.orientation
        if orientation.isPortrait {
            stackView.axis = .vertical
        } else if orientation.isLandscape {
            stackView.axis = .horizontal
        }
    }
    
    @objc func didTapBurButton() {
        let sb = UIStoryboard(name: "ReceiptViewController", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "ReceiptViewController") { [unowned self] coder in
            let receiptVC = ReceiptViewController(coder: coder, items: items)
            return receiptVC
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func deselectButtons() {
        tipSelection.forEach { button in
            button.isSelected = false
        }
    }
    
    @IBAction func didTapSmallTipButton() {
        deselectButtons()
        smallTipButton.isSelected = true
        tipOptions = .small
    }
    
    
    @IBAction func didTapMediumTipButton() {
        deselectButtons()
        mediumTipButton.isSelected = true
        tipOptions = .medium
    }
    
    @IBAction func didTapLargeTipButton() {
        deselectButtons()
        largeTipButton.isSelected = true
        tipOptions = .large
    }
    
    
    @IBAction func didTapSkipButton() {
        deselectButtons()
        skipButton.isSelected = true
        tipOptions = .none
    }
}
