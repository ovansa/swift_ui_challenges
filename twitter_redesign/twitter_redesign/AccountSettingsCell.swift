//
//  SettingsCell.swift
//  twitter_redesign
//
//  Created by Muhammed Ibrahim on 10/11/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

let settingsIconBlueColor = UIColor(displayP3Red: 0/255, green: 97/255, blue: 141/255, alpha: 1)

class AccountSettingsCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupCellAttributes(title: String, iconName: String) {
        titleLabel.text = title
        titleIcon.image = UIImage(systemName: iconName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleIcon: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = settingsIconBlueColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Account"
        label.font = UIFont(name: "Avenir", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let arrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = settingsIconBlueColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupViews() {
        addSubview(titleIcon)
        addSubview(titleLabel)
        addSubview(arrowButton)
        
        NSLayoutConstraint.activate([
            titleIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            titleIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleIcon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            titleIcon.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: titleIcon.trailingAnchor, constant: 15.0),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 2.0)
        ])
        
        NSLayoutConstraint.activate([
            arrowButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0),
            arrowButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            arrowButton.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        ])
    }
}
