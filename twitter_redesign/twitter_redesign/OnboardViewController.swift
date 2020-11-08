//
//  HomeViewController.swift
//  twitter_redesign
//
//  Created by Muhammed Ibrahim on 07/11/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

let lightBlueColor = UIColor(displayP3Red: 3/255, green: 169/255, blue: 244/255, alpha: 1)
let darkBlueColor = UIColor(displayP3Red: 0/255, green: 125/255, blue: 181/255, alpha: 1)

class OnboardViewController: UIViewController {
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Twitter"
        label.font = UIFont(name: "Avenir-Heavy", size: 24)
        label.textAlignment = .center
        label.textColor = lightBlueColor
        return label
    }()
    
    let welcomeDescription: UILabel = {
        let label = UILabel()
        label.text = "See what's happening in the world right now!"
        label.font = UIFont(name: "Avenir", size: 14)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let centerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let welcomeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "welcome")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 15)
        button.backgroundColor = lightBlueColor
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 16)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func login() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    private func setupLayout() {
        view.addSubview(topView)
        view.addSubview(centerView)
        view.addSubview(bottomView)
        
        let topStackView = UIStackView(arrangedSubviews: [welcomeLabel, welcomeDescription])
        topStackView.distribution = .equalSpacing
        topStackView.axis = .vertical
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(topStackView)
        
        centerView.addSubview(welcomeImageView)
        
        let stackView = UIStackView(arrangedSubviews: [loginButton, signUpButton])
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33)
        ])
        
        NSLayoutConstraint.activate([
            centerView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            centerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            centerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33)
        ])
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: centerView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            topStackView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            topStackView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            topStackView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.2),
            topStackView.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            welcomeImageView.heightAnchor.constraint(equalTo: centerView.heightAnchor, multiplier: 0.8),
            welcomeImageView.widthAnchor.constraint(equalTo: centerView.widthAnchor, multiplier: 0.8),
            welcomeImageView.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
            welcomeImageView.centerYAnchor.constraint(equalTo: centerView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            stackView.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.3),
            stackView.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 45.0)
        ])
    }
}
