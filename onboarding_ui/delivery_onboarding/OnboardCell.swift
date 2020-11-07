//
//  OnboardCell.swift
//  delivery_onboarding
//
//  Created by Muhammed Ibrahim on 14/10/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

class OnboardCell: UICollectionViewCell {
    let centerShape: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "1shape"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let centerImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "1item"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let descriptionText: UITextView = {
        let textView = UITextView()
        
        let text = NSMutableAttributedString(string: "Fresh Food", attributes: [NSAttributedString.Key.font
            : UIFont(name: "Avenir-Heavy", size: 25)!, NSAttributedString.Key.foregroundColor: UIColor.black])
        
        text.append(NSAttributedString(string: "\n\n\nLorem ipsum dolor sit amet, consectetuer  adipiscing elit. Lorem ipsum dolor sit amet, consectetuer  adipiscing elit.", attributes: [NSAttributedString.Key.font: UIFont(name: "Avenir", size: 14)!, NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = text
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    var onboardPage: OnboardPage? {
        didSet {
            guard let onboard = onboardPage else {return}
            
            centerShape.image = UIImage(named: onboard.centerShapeName)
            centerImage.image = UIImage(named: onboard.centerImageName)
            
            let attributedText = NSMutableAttributedString(string: onboard.headerText, attributes: [NSAttributedString.Key.font
                : UIFont(name: "Avenir-Heavy", size: 25)!, NSAttributedString.Key.foregroundColor: UIColor.black])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(onboard.bodyText)", attributes: [NSAttributedString.Key.font: UIFont(name: "Avenir", size: 14)!, NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            descriptionText.attributedText = attributedText
            descriptionText.textAlignment = .center
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        let topView = UIView()
        addSubview(topView)
        topView.addSubview(centerShape)
        centerShape.addSubview(centerImage)
        addSubview(descriptionText)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            centerShape.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            centerShape.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            centerShape.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.8),
            centerShape.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.9)
        ])
        
        NSLayoutConstraint.activate([
            centerImage.centerYAnchor.constraint(equalTo: centerShape.centerYAnchor),
            centerImage.centerXAnchor.constraint(equalTo: centerShape.centerXAnchor),
            centerImage.heightAnchor.constraint(equalTo: centerShape.heightAnchor, multiplier: 0.6),
            centerImage.widthAnchor.constraint(equalTo: centerShape.widthAnchor, multiplier: 0.6)
        ])
        
        NSLayoutConstraint.activate([
            descriptionText.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0),
            descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descriptionText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
