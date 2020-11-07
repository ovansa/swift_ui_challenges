//
//  ViewController.swift
//  delivery_onboarding
//
//  Created by Muhammed Ibrahim on 13/10/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
            : UIFont(name: "Avenir-Heavy", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.black])
        
        text.append(NSAttributedString(string: "\n\n\nLorem ipsum dolor sit amet, consectetuer  adipiscing elit. Lorem ipsum dolor sit amet, consectetuer  adipiscing elit.", attributes: [NSAttributedString.Key.font: UIFont(name: "Avenir", size: 14)!, NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = text
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = UIColor(red: 35/255, green: 158/255, blue: 254/254, alpha: 1.0)
        pageControl.pageIndicatorTintColor = UIColor(red: 35/255, green: 158/255, blue: 254/254, alpha: 0.2)
        pageControl.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        return pageControl
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 15)
        let nextColor = UIColor(red: 35/255, green: 158/255, blue: 254/254, alpha: 1.0)
        button.setTitleColor(nextColor, for: .normal)
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = nextColor
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.layer.transform = CATransform3DMakeScale(0.8, 0.7, 1.2)
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        view.addSubview(skipButton)
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            skipButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            pageControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15)
        ])
        
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            nextButton.heightAnchor.constraint(equalToConstant: 25),
            nextButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    fileprivate func setup() {
        let topView = UIView()
        view.addSubview(topView)
        topView.addSubview(centerShape)
        centerShape.addSubview(centerImage)
        view.addSubview(descriptionText)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.topAnchor.constraint(equalTo: view.topAnchor)
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
            descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
