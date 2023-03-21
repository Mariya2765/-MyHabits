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
        static let collectionID = "collectID"
    }

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsOfCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 247/255.0, alpha: 1.0)
        collectionView.showsVerticalScrollIndicator = true
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: Constants.reuseIdentifier)
        collectionView.register(SaveHabitCollectionViewCell.self, forCellWithReuseIdentifier: Constants.collectionID)

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
        let habitVc = HabitViewController()
        let habitNavContr = UINavigationController(rootViewController: habitVc)

        let appearanceNavContr = UINavigationBarAppearance()
        appearanceNavContr.configureWithDefaultBackground()
        habitNavContr.navigationBar.standardAppearance = appearanceNavContr
        habitNavContr.navigationBar.scrollEdgeAppearance = appearanceNavContr
        habitNavContr.navigationBar.prefersLargeTitles = false
        habitNavContr.navigationBar.backgroundColor = .white

//        habitNavContr.navigationBar.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 17), .foregroundColor: UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)]
        // во вью дидлоад добавить HabitViewController()
        // цвет для навиг бара
        // во вью дидлоад навиг айтем
        
       

        navigationController?.present(habitNavContr, animated: true)

    }

   
}

    // UICollectionViewDelegateFlowLayout, UICollectionViewDataSource

extension HabitsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
        return 1
        } else {
            return HabitsStore.shared.habits.count
    }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as! HabitCollectionViewCell
        cell.configure(progress: HabitsStore.shared.todayProgress, title: "\(Int(HabitsStore.shared.todayProgress))%")
        cell.backgroundColor = .white

        return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.collectionID, for: indexPath) as! SaveHabitCollectionViewCell
//            cell.configure(title: HabitsStore.shared.habits, time: HabitsStore.shared.dates, color: Habit)

//            cell.configure(progress: HabitsStore.shared.todayProgress, title: "\(Int(HabitsStore.shared.todayProgress))%")
            cell.backgroundColor = .white

            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        sizeOfCollectionView()
//        CGSize(width: UIScreen.main.bounds.width - 48/3, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        40
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(
            top: 25,
            left: 8,
            bottom: 8,
            right: 8
        )
    }

    private func sizeOfCollectionView() -> CGSize {
//        let numberOfCells: CGFloat = 1
//        let offsetBetweenCells: CGFloat = 8

        let offsetFromCellToScreen: CGFloat = 20
        let cellHeight: CGFloat = 60
        let screenWidth = UIScreen.main.bounds.width
//        let side = (screenWidth - offsetBetweenCells * (numberOfCells - 1) - offsetFromCellToScreen * 2) / numberOfCells
        let cellWidth = screenWidth - offsetFromCellToScreen * 2
        let sizeOfCell = CGSize(width: cellWidth, height: cellHeight)
        return sizeOfCell
    }
}



