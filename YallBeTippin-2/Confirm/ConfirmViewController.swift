//
//  ConfirmViewController.swift
//  YallBeTippin-2
//
//  Created by James Volmert on 3/2/26.
//

import UIKit

class ConfirmViewController: UIViewController {

    lazy var barButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Confirm",
            style: .plain,
            target: self,
            action: #selector(didTapBurButton)
        )
        return button
    }()

    @IBOutlet weak var tableView: UITableView!
    private var items: [MenuItem]

    init(coder: NSCoder, items: [MenuItem]) {
        self.items = items
        super.init(coder: coder)!
    }

    // below is required with the init function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Submit"
        setupTableView()
        navigationItem.rightBarButtonItem = barButton
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            UINib(nibName: "ConfirmCell", bundle: nil),
            forCellReuseIdentifier: "ConfirmCell"
        )
    }
    
    @objc func didTapBurButton() {
        let sb = UIStoryboard(name: "AddTipViewController", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "AddTipViewController") { [unowned self] coder in
            let TipVC = AddTipViewController(coder: coder, items: items)
            return TipVC
        }
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension ConfirmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "ConfirmCell")
            as! ConfirmCell
        let item = items[indexPath.row]

        cell.configure(item: item, indexPath: indexPath)
        cell.delegate = self
        return cell
    }

}

extension ConfirmViewController: UITableViewDelegate {

}

extension ConfirmViewController: ConfirmCellDelegate {
    func didAdd(at indexPath: IndexPath) {
        items[indexPath.row].count += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }

    func didMinus(at indexPath: IndexPath) {
        items[indexPath.row].count -= 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }

}
