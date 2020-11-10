//
//  SettingsHeaderCell.swift
//  twitter_redesign
//
//  Created by Muhammed Ibrahim on 10/11/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

let headerBlueColor = UIColor(displayP3Red: 118/255, green: 157/255, blue: 174/255, alpha: 1.0)

class SettingsHeaderCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let headerLabel: UILabel = {
      let label = UILabel()
        label.text = "ACCOUNT SETTING"
        label.font = UIFont(name: "Avenir-Heavy", size: 13)
        label.textColor = headerBlueColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupLayout() {
        clipsToBounds = true
        addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        ])
    }
}
