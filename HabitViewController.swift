//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Мария on 16.02.2023.
//

import Foundation
import UIKit

class HabitViewController: UIViewController, UIColorPickerViewControllerDelegate {

    private let habitView = HabitViewCreate()

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
        let title = habitView.getHabbitTitle()
        let color: UIColor = .systemGreen
        let date = Date(habitView.dateTextField)
        // непонятно как текстфилд перевести в дату - почитать, посмотреть


//        HabitsStore.shared.habits.append(.init(name: title, date: Date(), color: color))
        HabitsStore.save(Habit.init(name: title, date: date, color: color))
        
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
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        habitView.imageColor.backgroundColor = color
        dismiss(animated: true, completion: nil)
    }

    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        habitView.imageColor.backgroundColor = color
    }

//    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
//        let color = viewController.selectedColor
//    }


}
