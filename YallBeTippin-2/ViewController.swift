//
//  ViewController.swift
//  YallBeTippin-2
//
//  Created by James Volmert on 2/27/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuTableView: UITableView!
    var data: [MenuItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupTableView()
    }


    func fetchData() {
        data = Api.shared.fetchData()
    }
    
    func setupTableView() {
        menuTableView.dataSource = self
        menuTableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let item = data[indexPath.row]
        cell.configure(item: item)
        return cell
    }
    
    
}

