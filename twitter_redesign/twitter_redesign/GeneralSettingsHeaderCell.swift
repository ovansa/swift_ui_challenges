//
//  GeneralSettingsHeaderCell.swift
//  twitter_redesign
//
//  Created by Muhammed Ibrahim on 10/11/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

class GeneralSettingsHeaderCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let headerLabel: UILabel = {
      let label = UILabel()
        label.text = "GENERAL SETTING"
        label.font = UIFont(name: "Avenir-Heavy", size: 13)
        label.textColor = headerBlueColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupLayout() {
        addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        ])
    }
}
