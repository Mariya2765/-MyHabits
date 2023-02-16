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
        tfHabit.alpha = 0.6
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

    let scrollView: UIScrollView = {
        var logScrollView = UIScrollView()
        logScrollView.keyboardDismissMode = .interactive
        logScrollView.backgroundColor = .white
        logScrollView.translatesAutoresizingMaskIntoConstraints = false

        return logScrollView

    }()

    let contentView: UIView = {
        var content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false

        return content

    }()


    override init(frame: CGRect) {
        super.init(frame: frame)

//        addElements()
//        addConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addElements() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabelName)
        contentView.addSubview(nameOfHabit)


    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            titleLabelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            titleLabelName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabelName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabelName.heightAnchor.constraint(equalToConstant: 50),

            nameOfHabit.topAnchor.constraint(equalTo: titleLabelName.bottomAnchor),
            nameOfHabit.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameOfHabit.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameOfHabit.heightAnchor.constraint(equalToConstant: 50)






        ])
    }
}
