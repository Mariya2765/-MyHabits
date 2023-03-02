//
//  SaveHabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Мария on 02.03.2023.
//

import Foundation
import UIKit

class SaveHabitCollectionViewCell: UICollectionViewCell {

   static let reusebleID = "collection ID"

    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 17, weight: .semibold)
        title.textColor = .systemBlue
        title.text = "dfgdjhx"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private var titleTime: UILabel = {
        var title = UILabel()
        title.font = .systemFont(ofSize: 13, weight: .regular)
        title.textColor = .black
        title.alpha = 0.6
        title.text = "everyday"

//        title.text = "50%"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private let imageColor: UIView = {
       let image = UIView(frame: CGRect(x: 10, y: 15, width: 30, height: 30))
       image.layer.cornerRadius = image.frame.height/2
       image.layer.borderWidth = 15
       image.backgroundColor = .systemOrange
       image.layer.borderColor = UIColor.orange.cgColor
       image.clipsToBounds = true
       image.translatesAutoresizingMaskIntoConstraints = false

//        image.addTarget(self, action: #selector(colorPressed), for: .touchUpInside)

       return image

   }()

    private let counter: UILabel = {
        let counter = UILabel()
        counter.font = .systemFont(ofSize: 13, weight: .regular)
        counter.textColor = .black
        counter.alpha = 0.6
        counter.translatesAutoresizingMaskIntoConstraints = false
        return counter
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addElements()
        addConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
    }

    private func addElements() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(titleTime)
        contentView.addSubview(imageColor)
        contentView.addSubview(counter)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),

            titleTime.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 15),
            titleTime.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            titleTime.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20),

            imageColor.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50),
            imageColor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
            imageColor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageColor.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),


            counter.topAnchor.constraint(equalTo: titleTime.topAnchor, constant: 50),
            counter.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            counter.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20),
            counter.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    func configure(title: String, time: String, color: UIColor) {
        titleLabel.text = title
        titleTime.text = time
        imageColor.backgroundColor = color
      
    }
}
