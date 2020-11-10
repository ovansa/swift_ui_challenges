//
//  SettingsFooterCell.swift
//  twitter_redesign
//
//  Created by Muhammed Ibrahim on 10/11/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

class SettingsFooterCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let headerLabel: UILabel = {
      let label = UILabel()
        label.text = "This setting will affect all your Twitter accounts setting in this device."
        label.font = UIFont(name: "Avenir-Medium", size: 12)
        label.numberOfLines = 0
        label.textColor = UIColor.black.withAlphaComponent(0.3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupLayout() {
        addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
