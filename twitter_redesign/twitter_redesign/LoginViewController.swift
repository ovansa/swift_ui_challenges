//
//  LoginViewController.swift
//  twitter_redesign
//
//  Created by Muhammed Ibrahim on 07/11/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let leftBlueLine: UIView = {
        let view = UIView()
        view.backgroundColor = lightBlueColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rightWhiteLine: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let centerView: UIView = {
        let view = UIView()
        view.backgroundColor = lightBlueColor
        view.layer.cornerRadius = 5.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "twitter").withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Twitter"
        label.font = UIFont(name: "Avenir-Heavy", size: 22)
        label.textAlignment = .center
        label.textColor = lightBlueColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let welcomeDescription: UILabel = {
        let label = UILabel()
        label.text = "See what's happening in the world right now!"
        label.font = UIFont(name: "Avenir", size: 13)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Email View
    let emailContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5.0
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailBottomView: UIView = {
        let view = UIView()
        view.backgroundColor = darkBlueColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailValidMark: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark")
        imageView.tintColor = lightBlueColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Avenir", size: 14)
        textField.attributedPlaceholder = NSAttributedString(string: "**************", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 14)!, NSAttributedString.Key.foregroundColor: lightBlueColor
        ])
        textField.enablesReturnKeyAutomatically = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // Password View
    let passwordContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5.0
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordBottomView: UIView = {
        let view = UIView()
        view.backgroundColor = darkBlueColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordValidMark: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark")
        imageView.tintColor = lightBlueColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Avenir", size: 14)
        textField.attributedPlaceholder = NSAttributedString(string: "email@email.com", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 14)!, NSAttributedString.Key.foregroundColor: lightBlueColor
        ])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 15)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(forgotPassword), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 14)
        button.setTitleColor(lightBlueColor, for: .normal)
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "if new with us"
        label.font = UIFont(name: "Avenir-Medium", size: 14)
        label.textColor = UIColor.black.withAlphaComponent(0.7)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        setupLayout()
    }
    
    //MARK: - Create layout Views
    func setupLayout() {
        view.addSubview(leftBlueLine)
        view.addSubview(rightWhiteLine)
        view.addSubview(topView)
        view.addSubview(centerView)
        view.addSubview(bottomView)
        
        let centerStackView = UIStackView(arrangedSubviews: [passwordContainerView, emailContainerView])
        centerStackView.axis = .vertical
        centerStackView.distribution = .fillEqually
        centerStackView.spacing = 15
        centerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        topView.addSubview(logoImageView)
        topView.addSubview(welcomeLabel)
        topView.addSubview(welcomeDescription)
        
        centerView.addSubview(centerStackView)
        centerView.addSubview(forgotPasswordButton)
        
        emailContainerView.addSubview(emailBottomView)
        emailContainerView.addSubview(emailValidMark)
        emailContainerView.addSubview(emailTextField)
        passwordContainerView.addSubview(passwordBottomView)
        passwordContainerView.addSubview(passwordValidMark)
        passwordContainerView.addSubview(passwordTextField)
        
        bottomView.addSubview(loginButton)
        
        
        NSLayoutConstraint.activate([
            leftBlueLine.topAnchor.constraint(equalTo: view.topAnchor),
            leftBlueLine.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            leftBlueLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            leftBlueLine.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            rightWhiteLine.topAnchor.constraint(equalTo: view.topAnchor),
            rightWhiteLine.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rightWhiteLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rightWhiteLine.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33)
        ])
        
        NSLayoutConstraint.activate([
            centerView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            centerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            centerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33)
        ])
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: centerView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: -20),
            logoImageView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.15),
            logoImageView.widthAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.15),
            logoImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10.0),
        ])
        
        NSLayoutConstraint.activate([
            welcomeDescription.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            welcomeDescription.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10.0)
        ])
        
        NSLayoutConstraint.activate([
            centerStackView.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
            centerStackView.centerYAnchor.constraint(equalTo: centerView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            emailContainerView.widthAnchor.constraint(equalTo: centerView.widthAnchor, multiplier: 0.9),
            emailContainerView.heightAnchor.constraint(equalToConstant: 50),
            passwordContainerView.widthAnchor.constraint(equalTo: centerView.widthAnchor, multiplier: 0.9),
            passwordContainerView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            emailBottomView.leadingAnchor.constraint(equalTo: emailContainerView.leadingAnchor),
            emailBottomView.trailingAnchor.constraint(equalTo: emailContainerView.trailingAnchor),
            emailBottomView.bottomAnchor.constraint(equalTo: emailContainerView.bottomAnchor),
            emailBottomView.heightAnchor.constraint(equalToConstant: 3.0)
        ])
        
        NSLayoutConstraint.activate([
            emailValidMark.heightAnchor.constraint(equalTo: emailContainerView.heightAnchor, multiplier: 0.3),
            emailValidMark.widthAnchor.constraint(equalTo: emailContainerView.heightAnchor, multiplier: 0.3),
            emailValidMark.centerYAnchor.constraint(equalTo: emailContainerView.centerYAnchor),
            emailValidMark.trailingAnchor.constraint(equalTo: emailContainerView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailContainerView.topAnchor),
            emailTextField.bottomAnchor.constraint(equalTo: emailBottomView.topAnchor, constant: 5.0),
            emailTextField.leadingAnchor.constraint(equalTo: emailContainerView.leadingAnchor, constant: 20.0),
            emailTextField.trailingAnchor.constraint(equalTo: emailValidMark.leadingAnchor, constant: 5.0)
        ])
        
        NSLayoutConstraint.activate([
            passwordBottomView.leadingAnchor.constraint(equalTo: passwordContainerView.leadingAnchor),
            passwordBottomView.trailingAnchor.constraint(equalTo: passwordContainerView.trailingAnchor),
            passwordBottomView.bottomAnchor.constraint(equalTo: passwordContainerView.bottomAnchor),
            passwordBottomView.heightAnchor.constraint(equalToConstant: 3.0)
        ])
        
        NSLayoutConstraint.activate([
            passwordValidMark.heightAnchor.constraint(equalTo: passwordContainerView.heightAnchor, multiplier: 0.3),
            passwordValidMark.widthAnchor.constraint(equalTo: passwordContainerView.heightAnchor, multiplier: 0.3),
            passwordValidMark.centerYAnchor.constraint(equalTo: passwordContainerView.centerYAnchor),
            passwordValidMark.trailingAnchor.constraint(equalTo: passwordContainerView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordContainerView.topAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordBottomView.topAnchor, constant: 5.0),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordContainerView.leadingAnchor, constant: 20.0),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordValidMark.leadingAnchor, constant: 5.0)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: centerStackView.bottomAnchor, constant: 15),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: centerStackView.trailingAnchor),
        ])
        
        let signUpStackView = UIStackView(arrangedSubviews: [signUpButton, signUpLabel])
        signUpStackView.axis = .horizontal
        signUpStackView.distribution = .fillProportionally
        signUpStackView.spacing = 5
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.addSubview(signUpStackView)
        
        NSLayoutConstraint.activate([
            signUpStackView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -20),
            signUpStackView.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor)
        ])
    }
    
    //MARK: - Button Action Methods
    
    @objc func forgotPassword() {
        print("Forgot password")
    }
    
    @objc func login() {
        print("Login")
        navigationController?.pushViewController(NotificationsViewController(), animated: false)
    }
    
    @objc func signUp() {
        print("Register")
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        return true
    }
}
