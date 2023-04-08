//
//  HabitViewCreate.swift
//  MyHabits
//
//  Created by Мария on 13.02.2023.
//

import Foundation
import UIKit

protocol ColorPickerViewDelegate: AnyObject {
    func colorImageWasTapped()
    func dateWasChanged(_ date: Date)
}

class HabitViewCreate: UIView, UITextFieldDelegate {

    private let tapGestureRecognizer = UITapGestureRecognizer()

    weak var delegate: ColorPickerViewDelegate?

    func getHabbitTitle() -> String {
        return nameOfHabitTextField.text ?? ""
    }

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

     lazy var imageColor: UIView = {
        var image = UIView(frame: CGRect(x: 10, y: 15, width: 30, height: 30))
        image.layer.cornerRadius = image.frame.height/2
//        image.layer.borderWidth = 15
        image.backgroundColor = .systemOrange
//        image.layer.borderColor = UIColor.orange.cgColor
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false

//        image.addTarget(self, action: #selector(colorPressed), for: .touchUpInside)

        return image

    }()

    private let timeTitle: UILabel = {
        let titleTime = UILabel()
        titleTime.text = "ВРЕМЯ"
        titleTime.font = .systemFont(ofSize: 13, weight: .semibold)
        titleTime.textColor = .black
        titleTime.translatesAutoresizingMaskIntoConstraints = false

        return titleTime
    }()

    private let everyDayLabel: UILabel = {
        let label = UILabel()
        label.text = "Каждый день в"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    lazy var dateTextField: UITextField = {
        let dateTF = UITextField()

        dateTF.font = .systemFont(ofSize: 17, weight: .regular)
        dateTF.textColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        dateTF.textAlignment = .left
        dateTF.autocapitalizationType = .none
//        dateTF.text = "00"
        dateTF.translatesAutoresizingMaskIntoConstraints = false

//        tfHabit.tintColor = .systemBlue

        return  dateTF

    }()

    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.frame = CGRect(x: 10, y: 50, width: 100, height: 200)
        datePicker.datePickerMode = .time
        datePicker.backgroundColor = UIColor.white
        datePicker.preferredDatePickerStyle = .wheels

        return datePicker
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
        dateTextField.inputView = datePicker

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
        contentView.addSubview(timeTitle)
        contentView.addSubview(everyDayLabel)

        contentView.addSubview(dateTextField)
        imageColor.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.addTarget(self, action: #selector(colorTapGesture))
        datePicker.addTarget(self, action: #selector(handleDateChanged(picker:)), for: .valueChanged)


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
            titleLabelName.heightAnchor.constraint(equalToConstant: 30),

            nameOfHabitTextField.topAnchor.constraint(equalTo: titleLabelName.bottomAnchor, constant: 10),
            nameOfHabitTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            nameOfHabitTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            nameOfHabitTextField.heightAnchor.constraint(equalToConstant: 30),

            colorLabelName.topAnchor.constraint(equalTo: nameOfHabitTextField.bottomAnchor, constant: 20),
            colorLabelName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            colorLabelName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            colorLabelName.heightAnchor.constraint(equalToConstant: 30),

            imageColor.topAnchor.constraint(equalTo: colorLabelName.bottomAnchor, constant: 10),
            imageColor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
//            imageColor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            imageColor.heightAnchor.constraint(equalToConstant: 30),
            imageColor.widthAnchor.constraint(equalToConstant: 30),


            timeTitle.topAnchor.constraint(equalTo: imageColor.bottomAnchor, constant: 20),
            timeTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            timeTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            timeTitle.heightAnchor.constraint(equalToConstant: 30),


            everyDayLabel.topAnchor.constraint(equalTo: timeTitle.bottomAnchor, constant: 20),
            everyDayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            everyDayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            everyDayLabel.heightAnchor.constraint(equalToConstant: 20),
            everyDayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            dateTextField.topAnchor.constraint(equalTo: timeTitle.bottomAnchor, constant: 20),
            dateTextField.leadingAnchor.constraint(equalTo: everyDayLabel.leadingAnchor, constant: 130),
            dateTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            dateTextField.heightAnchor.constraint(equalToConstant: 20)






        ])
    }

    @objc func colorTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        delegate?.colorImageWasTapped()
    }

    @objc
    private func handleDateChanged(picker: UIDatePicker) {
       
        delegate?.dateWasChanged(picker.date)


    }


//    @objc private func colorPressed() {
//        let picker = UIColorPickerViewController()
//        picker.selectedColor = self.view.backgroundColor!
//        picker.delegate = self
//        self.present(picker, animated: true, completion: nil)
//    }
}
