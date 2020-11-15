//
//  NotificationsViewController.swift
//  twitter_redesign
//
//  Created by Muhammed Ibrahim on 09/11/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

struct NotificationItem {
    let mainText: String
    let centerText: String
    let subText: String
    let descriptionText: String
    
}

class NotificationsViewController: UIViewController {
    let messages = [
        NotificationItem(mainText: "Ovansa ", centerText: "replied to ", subText: "Halibee", descriptionText: "Please share you exact location for necessary action."),
        NotificationItem(mainText: "Ovansa ", centerText: "shared a post ", subText: "", descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi molestie finibus sapien, sit amet hendrerit eros facilisis non. Integer sit amet eros ut diam lacinia vulputate nec ultricies lacus."),
        NotificationItem(mainText: "", centerText: "Retweets from ", subText: "Halibee", descriptionText: "Etiam eu enim in metus lobortis scelerisque. Curabitur gravida, nibh sit amet aliquam lobortis, dolor risus fringilla nisi, ac tincidunt ante nulla in dolor. Donec elementum neque et arcu scelerisque, eu tincidunt leo placerat. Suspendisse in purus odio. Mauris sit amet sem lectus. Duis scelerisque velit quis sagittis suscipit."),
        NotificationItem(mainText: "Halimah ", centerText: "started a broadcast ", subText: "", descriptionText: "Link address https://www.youtube.com/watch?v=qoLPeoYlh_I"),
        NotificationItem(mainText: "Ovansa ", centerText: "replied to ", subText: "Halibee", descriptionText: "Please share you exact location for necessary action."),
        NotificationItem(mainText: "Ovansa ", centerText: "shared a post ", subText: "", descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi molestie finibus sapien, sit amet hendrerit eros facilisis non. Integer sit amet eros ut diam lacinia vulputate nec ultricies lacus."),
        NotificationItem(mainText: "", centerText: "Retweets from ", subText: "Halibee", descriptionText: "Etiam eu enim in metus lobortis scelerisque. Curabitur gravida, nibh sit amet aliquam lobortis, dolor risus fringilla nisi, ac tincidunt ante nulla in dolor. Donec elementum neque et arcu scelerisque, eu tincidunt leo placerat. Suspendisse in purus odio. Mauris sit amet sem lectus. Duis scelerisque velit quis sagittis suscipit."),
        NotificationItem(mainText: "Halimah ", centerText: "started a broadcast ", subText: "", descriptionText: "Link address https://www.youtube.com/watch?v=qoLPeoYlh_I"),
        NotificationItem(mainText: "Ovansa ", centerText: "replied to ", subText: "Halibee", descriptionText: "Please share you exact location for necessary action."),
        NotificationItem(mainText: "Ovansa ", centerText: "shared a post ", subText: "", descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi molestie finibus sapien, sit amet hendrerit eros facilisis non. Integer sit amet eros ut diam lacinia vulputate nec ultricies lacus."),
        NotificationItem(mainText: "", centerText: "Retweets from ", subText: "Halibee", descriptionText: "Etiam eu enim in metus lobortis scelerisque. Curabitur gravida, nibh sit amet aliquam lobortis, dolor risus fringilla nisi, ac tincidunt ante nulla in dolor. Donec elementum neque et arcu scelerisque, eu tincidunt leo placerat. Suspendisse in purus odio. Mauris sit amet sem lectus. Duis scelerisque velit quis sagittis suscipit."),
    ]
    
    let tableCellId = "tableCellId"
    
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
        menuButton.addTarget(self, action: #selector(navbarButtonPressed), for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: menuButton)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 20)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 20)
        currHeight?.isActive = true
        
        navigationItem.leftBarButtonItem = menuBarItem
    }
    
    func setupRightNavItem() {
        let mentionButton = UIButton(type: .custom)
        mentionButton.setImage(#imageLiteral(resourceName: "mention").withRenderingMode(.alwaysOriginal), for: .normal)
        mentionButton.imageView?.contentMode = .scaleAspectFit
        mentionButton.addTarget(self, action: #selector(navbarButtonPressed), for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: mentionButton)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 18)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 18)
        currHeight?.isActive = true
        
        navigationItem.rightBarButtonItem = menuBarItem
    }
    
    @objc func navbarButtonPressed() {
        print("Navbar Pressed")
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        notificationTableView.register(NotificationViewCell.self, forCellReuseIdentifier: tableCellId)
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        
        setupNavigationBar()
        setupLayout()
    }
    
    let notificationTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    func setupLayout() {
        view.addSubview(notificationTableView)
        
        NSLayoutConstraint.activate([
            notificationTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15.0),
            notificationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            notificationTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            notificationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
}

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationTableView.dequeueReusableCell(withIdentifier: tableCellId, for: indexPath) as! NotificationViewCell
        cell.notificationItem = messages[indexPath.item]
        return cell
    }
}
