//
//  FeedsViewCell.swift
//  twitter_redesign
//
//  Created by Muhammed Ibrahim on 14/11/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

class FeedsViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellContainerView: UIView = {
       let view = UIView()
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 10.0
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let hashTagText: UILabel = {
       let label = UILabel()
        label.text = "#alertDonShow"
        label.font = UIFont(name: "Avenir-Medium", size: 13)
        label.textColor = lightBlueColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionText: UILabel = {
       let label = UILabel()
        label.text = "The relevant UICollectionViewFlowLayout instance is UICollection View FlowLayout."
        label.font = UIFont(name: "Avenir", size: 11)
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let otherText: UILabel = {
       let label = UILabel()
        label.text = "The relevant"
        label.font = UIFont(name: "Avenir-Medium", size: 11)
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupCell() {
        addSubview(cellContainerView)
        
        cellContainerView.addSubview(hashTagText)
        cellContainerView.addSubview(descriptionText)
        cellContainerView.addSubview(otherText)
        
        NSLayoutConstraint.activate([
            cellContainerView.topAnchor.constraint(equalTo: topAnchor),
            cellContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0)
        ])
        
        NSLayoutConstraint.activate([
            hashTagText.leadingAnchor.constraint(equalTo: cellContainerView.leadingAnchor, constant: 10.0),
            hashTagText.topAnchor.constraint(equalTo: cellContainerView.topAnchor, constant: 5.0)
        ])
        
        NSLayoutConstraint.activate([
            descriptionText.leadingAnchor.constraint(equalTo: cellContainerView.leadingAnchor, constant: 10.0),
            descriptionText.topAnchor.constraint(equalTo: hashTagText.bottomAnchor, constant: 5.0),
            descriptionText.trailingAnchor.constraint(equalTo: cellContainerView.trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            otherText.leadingAnchor.constraint(equalTo: cellContainerView.leadingAnchor, constant: 10.0),
            otherText.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 5.0),
            otherText.trailingAnchor.constraint(equalTo: cellContainerView.trailingAnchor, constant: -10)
        ])
    }
}
