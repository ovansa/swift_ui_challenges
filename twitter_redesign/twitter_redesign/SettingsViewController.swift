//
//  SettingsViewController.swift
//  twitter_redesign
//
//  Created by Muhammed Ibrahim on 09/11/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

struct Settings {
    let title: String
    let iconName: String
}

class SettingsViewController: UIViewController {
    let cellId1 = "cellId1"
    let cellId2 = "cellId2"
    let headerId1 = "headerId1"
    let headerId2 = "headerId2"
    let footerId1 = "footerId1"
    
    let accountSettings = [Settings(title: "Account", iconName: "person.fill"), Settings(title: "Privacy and Safety", iconName: "lock.fill"), Settings(title: "Notifications", iconName: "bell.fill"), Settings(title: "Content Preferences", iconName: "doc.on.clipboard.fill"), Settings(title: "People", iconName: "bolt.circle.fill")]
    let generalSettings = [Settings(title: "Display", iconName: "desktopcomputer"), Settings(title: "Data Usage", iconName: "chart.pie.fill"), Settings(title: "Accessibility", iconName: "alarm.fill"), Settings(title: "About Twitter", iconName: "ant.fill")]
    
    let settingsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
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
        messageButton.setImage(#imageLiteral(resourceName: "Vector (1)").withRenderingMode(.alwaysOriginal), for: .normal)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        
        
        settingsCollection.delegate = self
        settingsCollection.dataSource = self
        
        settingsCollection.register(AccountSettingsCell.self, forCellWithReuseIdentifier: cellId1)
        settingsCollection.register(GeneralSettingsCell.self, forCellWithReuseIdentifier: cellId2)
        
        settingsCollection.register(SettingsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId1)
        settingsCollection.register(GeneralSettingsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId2)
        
        settingsCollection.register(SettingsFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId1)
        
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(settingsCollection)
        
        NSLayoutConstraint.activate([
            settingsCollection.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            settingsCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            settingsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            settingsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

extension SettingsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return accountSettings.count
        } else {
            return generalSettings.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = settingsCollection.dequeueReusableCell(withReuseIdentifier: cellId1, for: indexPath) as! AccountSettingsCell
            cell.setupCellAttributes(title: accountSettings[indexPath.item].title, iconName: accountSettings[indexPath.item].iconName)
            return cell
        } else {
            let cell = settingsCollection.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath) as! GeneralSettingsCell
            cell.setupCellAttributes(title: generalSettings[indexPath.item].title, iconName: generalSettings[indexPath.item].iconName)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: view.frame.size.width - 40, height: 50)
        }
        return CGSize(width: view.frame.size.width - 40, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //        return 0
    //    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if indexPath.section == 0 {
                let header = settingsCollection.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId1, for: indexPath) as! SettingsHeaderCell
                return header
            } else {
                let header = settingsCollection.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId2, for: indexPath) as! GeneralSettingsHeaderCell
                return header
            }
        } else {
            let footer = settingsCollection.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId1, for: indexPath) as! SettingsFooterCell
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize(width: view.frame.width, height: 50)
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize(width: view.frame.width, height: 60)
        }
        return .zero
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected: Section \(indexPath.section) -- Item \(indexPath.item)")
    }
}
