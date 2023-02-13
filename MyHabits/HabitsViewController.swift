//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Мария on 06.02.2023.
//

import UIKit

class HabitsViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Сегодня"

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabit))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)

    }

    @objc private func addHabit() {
    }
}
