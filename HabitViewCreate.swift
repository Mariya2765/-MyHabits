//
//  HabitViewCreate.swift
//  MyHabits
//
//  Created by Мария on 13.02.2023.
//

import Foundation
import UIKit

class HabitViewCreate: UIView, UITextFieldDelegate {

    private let titleLabelName: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 13, weight: .semibold)
        title.textColor = .black
        title.text = "НАЗВАНИЕ"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    lazy var nameOfHabitTextField: UITextField = {
        let tfHabit = UITextField()


        tfHabit.font = .systemFont(ofSize: 17, weight: .regular)
        tfHabit.textColor = .black

        tfHabit.autocapitalizationType = .none
        tfHabit.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        tfHabit.textAlignment = .left
        tfHabit.tintColor = .systemBlue
        tfHabit.delegate = self
        tfHabit.translatesAutoresizingMaskIntoConstraints = false

        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tfHabit.leftViewMode = .always
        tfHabit.leftView = spaceView
        tfHabit.tag = 1
        return tfHabit

    }()

    private let colorLabelName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .black
        label.text = "ЦВЕТ"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let imageColor: UIView = {
        let image = UIView(frame: CGRect(x: 10, y: 15, width: 30, height: 30))
        image.layer.cornerRadius = image.frame.height/2
        image.layer.borderWidth = 15
        image.backgroundColor = .systemOrange
        image.layer.borderColor = UIColor.orange.cgColor
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false

        return image

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

        addElements()
        addConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addElements() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabelName)
        contentView.addSubview(nameOfHabitTextField)
        contentView.addSubview(colorLabelName)
        contentView.addSubview(imageColor)


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

            titleLabelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabelName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabelName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
//            titleLabelName.heightAnchor.constraint(equalToConstant: 50),

            nameOfHabitTextField.topAnchor.constraint(equalTo: titleLabelName.bottomAnchor, constant: 10),
            nameOfHabitTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            nameOfHabitTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),

            colorLabelName.topAnchor.constraint(equalTo: nameOfHabitTextField.bottomAnchor, constant: 20),
            colorLabelName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            colorLabelName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),

            imageColor.topAnchor.constraint(equalTo: colorLabelName.bottomAnchor, constant: 10),
            imageColor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
//            imageColor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            imageColor.heightAnchor.constraint(equalToConstant: 30),
            imageColor.widthAnchor.constraint(equalToConstant: 30),
            imageColor.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)







        ])
    }
}
