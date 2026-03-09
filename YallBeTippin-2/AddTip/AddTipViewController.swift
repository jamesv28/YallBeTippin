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
        print(items)
        navigationItem.rightBarButtonItem = barButton
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
        
    }
    
    @IBAction func didTapSmallTipButton() {
    }
    
    
    @IBAction func didTapMediumTipButton() {
    }
    
    @IBAction func didTapLargeTipButton() {
    }
    
    
    @IBAction func didTapSkipButton() {
    }
}
