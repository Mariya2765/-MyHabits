//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Мария on 16.02.2023.
//

import Foundation
import UIKit

class HabitViewController: UIViewController {

    private let habitView = HabitViewCreate()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Создать"
//        view.backgroundColor = .white
        view.addSubview(habitView)
        habitView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            habitView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            habitView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }


}
