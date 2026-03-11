//
//  ReceiptViewController.swift
//  YallBeTippin-2
//
//  Created by James Volmert on 3/2/26.
//

import UIKit

class ReceiptViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
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
        setupTableView()
        print(items)
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension ReceiptViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}

extension ReceiptViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
