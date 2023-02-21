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

   

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    func subscribeKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
