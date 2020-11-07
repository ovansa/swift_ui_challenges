//
//  OnboardController.swift
//  delivery_onboarding
//
//  Created by Muhammed Ibrahim on 14/10/2020.
//  Copyright © 2020 Ovansa. All rights reserved.
//
import UIKit

class OnboardController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let pages = [
        OnboardPage(centerShapeName: "1shape", centerImageName: "1item", headerText: "Fresh food", bodyText: "Fresh food Lorem ipsum dolor sit amet, consectetuer  adipiscing elit. Lorem ipsum dolor sit amet, consectetuer  adipiscing elit."),
        OnboardPage(centerShapeName: "2shape", centerImageName: "2item", headerText: "Fast Delivery", bodyText: "Good food Lorem ipsum dolor sit amet, consectetuer  adipiscing elit. Lorem ipsum dolor sit amet, consectetuer  adipiscing elit."),
        OnboardPage(centerShapeName: "3shape", centerImageName: "3item", headerText: "Easy Payment", bodyText: "Awesome food Lorem ipsum dolor sit amet, consectetuer  adipiscing elit. Lorem ipsum dolor sit amet, consectetuer  adipiscing elit.")
    ]
    
    let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func handleSkip() {
        nextButton.isHidden = true
        pageControl.isHidden = true
        skipButton.isHidden = true
        getStartedButton.isHidden = false
        
        let indexPath = IndexPath(item: pages.count - 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        collectionView.isScrollEnabled = false
    }
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
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
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        return button
    }()
    
    fileprivate func showLastPage() {
        nextButton.isHidden = true
        pageControl.isHidden = true
        skipButton.isHidden = true
        getStartedButton.isHidden = false
        
        let indexPath = IndexPath(item: pages.count - 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        collectionView.isScrollEnabled = false
    }
    
    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        
        if nextIndex >= pages.count - 1 {
            showLastPage()
        } else {
            let indexPath = IndexPath(item: nextIndex, section: 0)
            pageControl.currentPage = nextIndex
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            print("The next index \(nextIndex)")
        }
    }
    
    let getStartedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        let nextColor = UIColor(red: 35/255, green: 158/255, blue: 254/254, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 14)
        button.backgroundColor = nextColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(OnboardCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        
        getStartedButton.isHidden = true
        
        setUpOtherControls()
    }
    
    fileprivate func setUpOtherControls() {
        view.addSubview(skipButton)
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            skipButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            skipButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            pageControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15)
        ])
        
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        view.addSubview(getStartedButton)
        NSLayoutConstraint.activate([
            getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getStartedButton.heightAnchor.constraint(equalToConstant: 40),
            getStartedButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
