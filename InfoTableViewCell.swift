//
//  InfoTableViewCell.swift
//  MyHabits
//
//  Created by Мария on 10.02.2023.
//

import Foundation
import UIKit

class InfoTableViewCell: UITableViewCell {

    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 20, weight: .semibold)
        title.textColor = .black
        title.text = "Привычка за 21 день"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private let infoTextLabel: UILabel = {
        let text = UILabel()
        text.font = .systemFont(ofSize: 17, weight: .regular)
        text.textColor = .black
        text.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму: "
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)

        setUpMyCell()
        addConstraints()
        selectionStyle = .none

    }

    func setUpMyCell() {

        contentView.addSubview(titleLabel)
        contentView.addSubview(infoTextLabel)
    }

    func addConstraints() {
        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),


            infoTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            infoTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
