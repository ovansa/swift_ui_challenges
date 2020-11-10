//
//  NotificationViewCell.swift
//  twitter_redesign
//
//  Created by Muhammed Ibrahim on 09/11/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

class NotificationViewCell: UITableViewCell {
    
    let cellContainerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 10.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleText: UITextView = {
        let textView = UITextView()
        
        let text = NSMutableAttributedString(string: "Mumbai Police", attributes: [NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 14)!])
        text.append(NSAttributedString(string: " replied to ", attributes: [NSAttributedString.Key.font: UIFont(name: "Avenir", size: 13)!]))
        text.append(NSAttributedString(string: "Zeus Posseidon", attributes: [NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 14)!]))
        textView.attributedText = text
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let optionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "dots").withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(optionButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let notificationDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Please share your exact location for necessary actions. Please share your exact location for necessary actions. Please share your exact location for necessary actions. Please share your exact location for necessary actions."
        label.font = UIFont(name: "Avenir", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func optionButtonPressed() {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    func setupCellViews() {
        addSubview(cellContainerView)
        
        cellContainerView.addSubview(titleText)
        cellContainerView.addSubview(optionButton)
        cellContainerView.addSubview(notificationDescriptionLabel)
        
        NSLayoutConstraint.activate([
            cellContainerView.topAnchor.constraint(equalTo: topAnchor),
            cellContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0)
        ])
        
        NSLayoutConstraint.activate([
            titleText.topAnchor.constraint(equalTo: cellContainerView.topAnchor, constant: 10.0),
            titleText.leadingAnchor.constraint(equalTo: cellContainerView.leadingAnchor, constant: 10.0),
            titleText.trailingAnchor.constraint(equalTo: optionButton.leadingAnchor, constant: -30.0),
            titleText.heightAnchor.constraint(equalToConstant: 30.0)
        ])
        
        NSLayoutConstraint.activate([
            optionButton.topAnchor.constraint(equalTo: cellContainerView.topAnchor, constant: 15.0),
            optionButton.trailingAnchor.constraint(equalTo: cellContainerView.trailingAnchor, constant: -15),
            optionButton.heightAnchor.constraint(equalToConstant: 20.0),
            optionButton.widthAnchor.constraint(equalToConstant: 15.0)
        ])
        
        NSLayoutConstraint.activate([
            notificationDescriptionLabel.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 10.0),
            notificationDescriptionLabel.leadingAnchor.constraint(equalTo: titleText.leadingAnchor, constant: 5),
            notificationDescriptionLabel.trailingAnchor.constraint(equalTo: optionButton.leadingAnchor, constant: -30.0),
            notificationDescriptionLabel.bottomAnchor.constraint(equalTo: cellContainerView.bottomAnchor, constant: -10.0)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
