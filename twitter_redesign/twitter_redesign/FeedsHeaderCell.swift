//
//  FeedsHeaderCell.swift
//  twitter_redesign
//
//  Created by Muhammed Ibrahim on 14/11/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

class FeedsHeaderCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupView()
    }
    
    let cellImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "images")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let timeLabel: UILabel = {
       let label = UILabel()
        label.text = "23hr ago"
        label.font = UIFont(name: "Avenir", size: 10)
        label.textColor = UIColor.black.withAlphaComponent(0.3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "See which famous faces have entered the Bigg Boss 13 house"
        label.numberOfLines = 0
        label.font = UIFont(name: "Avenir-Heavy", size: 13)
        label.textColor = UIColor.black.withAlphaComponent(0.9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let mediaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Television", for: .normal)
        button.setTitleColor(lightBlueColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 10)
        button.backgroundColor = .white
        button.layer.borderColor = lightBlueColor.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 2.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let numTweetLabel: UILabel = {
        let label = UILabel()
        label.text = "1.1K"
        label.font = UIFont(name: "Avenir-Medium", size: 11)
        label.textColor = UIColor.black.withAlphaComponent(0.8)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numTweetSubLabel: UILabel = {
        let label = UILabel()
        label.text = " people are tweeting about this."
        label.font = UIFont(name: "Avenir", size: 11)
        label.textColor = UIColor.black.withAlphaComponent(0.7)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "TRENDS FOR YOU"
        label.font = UIFont(name: "Avenir-Bold", size: 12)
        label.textColor = settingsIconBlueColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(cellImageView)
        addSubview(timeLabel)
        addSubview(titleLabel)
        addSubview(mediaButton)
        addSubview(numTweetLabel)
        addSubview(numTweetSubLabel)
        addSubview(tableTitleLabel)
        
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: topAnchor),
            cellImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            cellImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.55)
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 7.0),
            timeLabel.leadingAnchor.constraint(equalTo: cellImageView.leadingAnchor, constant: 2.0),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 3.0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mediaButton.heightAnchor.constraint(equalToConstant: 20.0),
            mediaButton.widthAnchor.constraint(equalToConstant: 70.0),
            mediaButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5.0),
            mediaButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            numTweetLabel.topAnchor.constraint(equalTo: mediaButton.bottomAnchor, constant: 7.0),
            numTweetLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2.0),
        ])
        
        NSLayoutConstraint.activate([
            numTweetSubLabel.topAnchor.constraint(equalTo: mediaButton.bottomAnchor, constant: 5.0),
            numTweetSubLabel.leadingAnchor.constraint(equalTo: numTweetLabel.trailingAnchor, constant: 2.0)
        ])
        
        NSLayoutConstraint.activate([
            tableTitleLabel.topAnchor.constraint(equalTo: numTweetSubLabel.bottomAnchor, constant: 15.0),
            tableTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            
        ])
    }
}
