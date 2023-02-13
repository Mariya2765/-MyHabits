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
        text.text = """
 Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:

 1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага.

 2. Выдержать 2 дня в прежнем состоянии самоконтроля.

 3. Отметить в дневнике первую неделю изменений и подвести итоги - что оказалось тяжелее, что легче, с чем предстоит серьезно бороться.

 4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств.

 5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой.

 6. На 90-й день соблюдения техники все лишнее из "прошлой жизни" перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся.

 Источник: psychbook.ru
 """
        text.numberOfLines = 0
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

            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),


            infoTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            infoTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            infoTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
