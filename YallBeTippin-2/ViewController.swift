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
    
    
    @IBAction func didTapCartButton(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "ConfirmViewController", bundle: nil)
        let items: [MenuItem] = getMenuItems()
        let vc = sb.instantiateViewController(identifier: "ConfirmViewController") { coder in
            let confirmVC = ConfirmViewController(coder: coder, items: items)
            return confirmVC
        }
        pushVC(vc)
    }
    
    func getMenuItems() -> [MenuItem] {
        var items: [MenuItem] = []
        for item in data {
            if item.count > 0 {
                items.append(item)
            }
        }
        return items
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let item = data[indexPath.row]
        cell.configure(item: item, indexPath: indexPath)
        cell.delegate = self
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menuTableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.row].count += 1
        menuTableView.reloadRows(at: [indexPath], with: .none)
        
    }
}

extension ViewController: HomeTableViewCellDelegate {
    func didAdd(at indexPath: IndexPath) {
        data[indexPath.row].count += 1
        menuTableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func didMinus(at indexPath: IndexPath) {
        data[indexPath.row].count -= 1
        menuTableView.reloadRows(at: [indexPath], with: .none)
    }

    
    
}

