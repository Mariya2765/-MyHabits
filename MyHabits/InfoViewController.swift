//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Мария on 06.02.2023.
//

import UIKit

class InfoViewController: UIViewController {

    private enum Constants {
        static let reuseIdentifire = "cellID"
    }

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifire )
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        self.tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifire)
        addConstraintsOfTableView()

    }

    private func addConstraintsOfTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

// UIDataSource
extension InfoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifire, for: indexPath) as! InfoTableViewCell
        var content = cell.defaultContentConfiguration()
        content.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму: "
        cell.contentConfiguration = content

        return cell
    }




}
