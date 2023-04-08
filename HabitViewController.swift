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
    private var currentDate = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Создать"
//        view.backgroundColor = .white
        view.addSubview(habitView)
        habitView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints()

        let buttonSave = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveHabit))
        buttonSave.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        navigationItem.rightBarButtonItem = buttonSave

        let buttonCancel = UIBarButtonItem(title: "Отмена", style: .done, target: self, action: #selector(cancelHabit))
        buttonCancel.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        navigationItem.leftBarButtonItem = buttonCancel

        habitView.delegate = self
        dateWasChanged(currentDate)
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            habitView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            habitView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

   

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    func subscribeKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func saveHabit() {

        let newHabit = Habit(name: habitView.nameOfHabitTextField.text ?? "",
                             date: currentDate,
                             color: habitView.imageColor.backgroundColor ?? .blue)
        let store = HabitsStore.shared
        store.habits.append(newHabit)
        dismiss(animated: true)
        HabitStoreObserver.shared.reload()
//        let title = habitView.getHabbitTitle()
//        let color: UIColor = .systemGreen
//        let date = Date(habitView.datePicker.date)
        // непонятно как текстфилд перевести в дату - почитать, посмотреть


//        HabitsStore.shared.habits.append(.init(name: title, date: Date(), color: color))
//        HabitsStore.save(Habit.init(name: title, date: date, color: color))
        
    }

    @objc private func cancelHabit() {
    }

    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - self.view.safeAreaInsets.bottom + 20, right: 0)
        self.habitView.scrollView.contentInset = insets
        self.habitView.scrollView.scrollIndicatorInsets = insets

    }

    @objc func keyboardWillHide(_ notification: NSNotification) {
        self.habitView.scrollView.contentInset = .zero
        self.habitView.scrollView.scrollIndicatorInsets = .zero
    }

}

extension HabitViewController: ColorPickerViewDelegate {

    func colorImageWasTapped() {
        let picker = UIColorPickerViewController()
        picker.selectedColor = habitView.backgroundColor ?? UIColor.black
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }

    func dateWasChanged(_ date: Date) {
        currentDate = date

        let formatter = DateFormatter ()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        let timeString = formatter.string(from: date)
        habitView.dateTextField.text = timeString


    }


}

extension HabitViewController: UIColorPickerViewControllerDelegate {


    func colorPickerViewController(
        _ viewController: UIColorPickerViewController,
        didSelect color: UIColor,
        continuously: Bool
    ) {
        // 1. поменять цвет
        habitView.imageColor.backgroundColor = color
        // 2. закрыть
            viewController.dismiss(animated: true)
    }
}
