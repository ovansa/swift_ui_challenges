//
//  FeedsController.swift
//  twitter_redesign
//
//  Created by Muhammed Ibrahim on 14/11/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//

import UIKit

extension FeedsController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = theCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedsViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 10, height: 100.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = theCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! FeedsHeaderCell
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width - 10, height: (view.frame.height * 0.47))
    }
}

class FeedsController: UIViewController {
    
    let cellId = "cellId"
    let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupView()
        theCollectionView.register(FeedsViewCell.self, forCellWithReuseIdentifier: cellId)
        theCollectionView.register(FeedsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        theCollectionView.delegate = self
        theCollectionView.dataSource = self
    }
    
    let theCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func setupView() {
        view.addSubview(theCollectionView)
        
        NSLayoutConstraint.activate([
            theCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            theCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            theCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            theCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
    
    
    
    
    
    
    
    
    
    
    
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
        //menuButton.addTarget(self, action: #selector(menuPressed), for: .touchUpInside)
        
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
        //messageButton.addTarget(self, action: #selector(messagePressed), for: .touchUpInside)
        
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
}
