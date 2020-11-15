//
//  CustomTabController.swift
//  twitter_redesign
//
//  Created by Muhammed Ibrahim on 10/11/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

class CustomTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = headerBlueColor
        
        
        let homeNavController = UINavigationController(rootViewController: HomeViewController())
//        homeNavController.tabBarItem.title = "Home"
        homeNavController.tabBarItem.image = UIImage(systemName: "house.fill")
        
        let newsNavController = UINavigationController(rootViewController: FeedsController())
//        newsNavController.tabBarItem.title = "News"
        newsNavController.tabBarItem.image = UIImage(systemName: "folder.fill")
        
        let notificationNavController = UINavigationController(rootViewController: NotificationsViewController())
//        notificationNavController.tabBarItem.title = "Notifications"
        notificationNavController.tabBarItem.image = UIImage(systemName: "bell.fill")
        
        let settingsNavController = UINavigationController(rootViewController: SettingsViewController())
//        settingsNavController.tabBarItem.title = "Settings"
        settingsNavController.tabBarItem.image = UIImage(systemName: "gear")
        
        viewControllers = [homeNavController, newsNavController, notificationNavController, settingsNavController]
    }

}
