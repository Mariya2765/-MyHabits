//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Мария on 14.02.2023.
//

import Foundation
import UIKit

class HabitCollectionViewCell: UICollectionViewCell {

    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 13, weight: .regular)
        title.textColor = .black
        title.text = "Все получится!"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private var titleProgress: UILabel = {
        var title = UILabel()
        title.font = .systemFont(ofSize: 13, weight: .regular)
        title.textColor = .black
        // задала пока на пробу
        title.text = "50%"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private var progressView: UIProgressView = {
        var progress = UIProgressView()
        progress.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)
        // задала пока на пробу
        progress.progress = 0.8
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addElements()
        addConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addElements() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(titleProgress)
        contentView.addSubview(progressView)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
//            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),

            titleProgress.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleProgress.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleProgress.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 15),

            progressView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            progressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            progressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            progressView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func configure(progress: Float, title: String) {
        progressView.progress = progress
        titleProgress.text = title
    }
}
