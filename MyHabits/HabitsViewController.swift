//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Мария on 06.02.2023.
//

import UIKit

class HabitsViewController: UIViewController {

    private enum Constants {
        static let reuseIdentifier = "collection_cell"
    }

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsOfCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = true
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: Constants.reuseIdentifier)

        navigationItem.title = "Сегодня"

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabit))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
    }

    private  func addConstraintsOfCollectionView() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50)
        ])
    }

    @objc private func addHabit() {
//        let habitVc =

    }
}

    // UICollectionViewDelegateFlowLayout, UICollectionViewDataSource

extension HabitsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as! HabitCollectionViewCell
        cell.configure(progress: HabitsStore.shared.todayProgress, title: "\(Int(HabitsStore.shared.todayProgress))%")

        return cell
    }
}



