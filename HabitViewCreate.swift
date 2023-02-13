//
//  HabitViewCreate.swift
//  MyHabits
//
//  Created by Мария on 13.02.2023.
//

import Foundation
import UIKit

class HabitViewCreate: UIView {

    private let titleLabelName: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 13, weight: .semibold)
        title.textColor = .black
        title.text = "НАЗВАНИЕ"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    lazy var nameOfHabit: UITextField = {
        let tfHabit = UITextField()

        tfHabit.backgroundColor = .systemGray6
        tfHabit.layer.borderColor = UIColor.lightGray.cgColor
//        tfHabit.layer.borderWidth = 0.5
//        tfHabit.layer.cornerRadius = 10
//        tfHabit.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        tfHabit.font = .systemFont(ofSize: 13, weight: .regular)
        tfHabit.textColor = .black
        tfHabit.autocapitalizationType = .none
        tfHabit.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        tfHabit.textAlignment = .left
        tfHabit.tintColor = .systemBlue
//        tfHabit.delegate = self
//        tfHabit.tag = 1

//        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
//        tfLogin.leftViewMode = .always
//        tfLogin.leftView = spaceView
//        tfLogin.translatesAutoresizingMaskIntoConstraints = false

        return tfHabit

    }()




    override init(frame: CGRect) {
        super.init(frame: frame)

//        addElements()
//        addConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
