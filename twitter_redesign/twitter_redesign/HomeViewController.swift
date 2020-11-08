//
//  HomeViewController.swift
//  twitter_redesign
//
//  Created by Muhammed Ibrahim on 08/11/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

let lighterBlueColor = UIColor(displayP3Red: 174/255, green: 219/255, blue: 236/255, alpha: 1)

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        view.backgroundColor = .white
        setupLayout()
    }
    
    //MARK: - Navigation Bar Setup Methods
    
    func setupNavigationBar() {
        setupLeftNavItem()
        setupRightNavItem()
        setupTitleNavItem()
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    func setupLeftNavItem() {
        let menuButton = UIButton(type: .custom)
        menuButton.setImage(#imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), for: .normal)
        menuButton.imageView?.contentMode = .scaleAspectFit
        menuButton.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        menuButton.addTarget(self, action: #selector(menuPressed), for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: menuButton)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 20)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 20)
        currHeight?.isActive = true
        
        navigationItem.leftBarButtonItem = menuBarItem
    }
    
    func setupRightNavItem() {
        let messageButton = UIButton(type: .custom)
        messageButton.setImage(#imageLiteral(resourceName: "message").withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.imageView?.contentMode = .scaleAspectFit
        messageButton.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        messageButton.addTarget(self, action: #selector(messagePressed), for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: messageButton)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 20)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 20)
        currHeight?.isActive = true
        
        navigationItem.rightBarButtonItem = menuBarItem
    }
    
    func setupTitleNavItem() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "twitter").withRenderingMode(.alwaysOriginal))
        titleImageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            titleImageView.heightAnchor.constraint(equalToConstant: 30.0),
            titleImageView.widthAnchor.constraint(equalToConstant: 30.0)
        ])
        navigationItem.titleView = titleImageView
    }
    
    @objc func menuPressed() {
        print("Menu pressed")
    }
    
    @objc func messagePressed() {
        print("Message pressed")
    }
    
    //MARK: - Body Layout Setup
    
    let searchContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = lighterBlueColor.withAlphaComponent(0.2)
        view.layer.borderWidth = 0.5
        view.layer.borderColor = lighterBlueColor.withAlphaComponent(0.5).cgColor
        view.layer.cornerRadius = 30.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let searchLogo: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Screenshot 2019-09-27 at 4.43.47 PM"))
        imageView.layer.cornerRadius = imageView.frame.width / 4
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let selectImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Group 2 (1)").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Avenir", size: 14)
        textField.attributedPlaceholder = NSAttributedString(string: "What's happening?", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Avenir", size: 14)!, NSAttributedString.Key.foregroundColor: lightBlueColor
        ])
        textField.enablesReturnKeyAutomatically = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    @objc func selectImage() {
        print("Select image")
    }
    
    func setupLayout() {
        view.addSubview(searchContainerView)
        
        searchContainerView.addSubview(searchLogo)
        searchContainerView.addSubview(selectImageButton)
        searchContainerView.addSubview(searchTextField)
        
        NSLayoutConstraint.activate([
            searchContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15.0),
            searchContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            searchContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            searchContainerView.heightAnchor.constraint(equalToConstant: 55.0)
        ])
        
        NSLayoutConstraint.activate([
            searchLogo.heightAnchor.constraint(equalTo: searchContainerView.heightAnchor, multiplier: 0.7),
            searchLogo.widthAnchor.constraint(equalTo: searchContainerView.heightAnchor, multiplier: 0.7),
            searchLogo.leadingAnchor.constraint(equalTo: searchContainerView.leadingAnchor, constant: 10.0),
            searchLogo.centerYAnchor.constraint(equalTo: searchContainerView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            selectImageButton.heightAnchor.constraint(equalTo: searchContainerView.heightAnchor, multiplier: 0.4),
            selectImageButton.widthAnchor.constraint(equalTo: searchContainerView.heightAnchor, multiplier: 0.4),
            selectImageButton.trailingAnchor.constraint(equalTo: searchContainerView.trailingAnchor, constant: -15.0),
            selectImageButton.centerYAnchor.constraint(equalTo: searchContainerView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: searchContainerView.topAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: searchContainerView.bottomAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: searchLogo.trailingAnchor, constant: 30.0),
            searchTextField.trailingAnchor.constraint(equalTo: selectImageButton.leadingAnchor, constant: -30.0)
        ])
    }
}
