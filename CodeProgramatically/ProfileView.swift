//
//  ProfileView.swift
//  CodeProgramatically
//
//  Created by Afiq Hamdan on 10/12/18.
//  Copyright © 2018 Afiq Hamdan. All rights reserved.
//

import Foundation
import UIKit
import Cartography

class ProfileView: UIView {
    
    // MARK: - Views
    
    let mainView: UIView = {
        // let view = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "My name is Khabib Nurmagomedov, My name is Khabib Nurmagomedov, My name is Khabib Nurmagomedov"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "khabib")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupViews()
        setupConstraints()
        setupAnimation()
        addInteraction()
    }
    
    private func setupViews() {
        self.addSubview(mainView)
        self.addSubview(titleLabel)
        self.addSubview(profileImageView)
    }
    
    private func setupConstraints() {
        
        //main view constraint iwth NSLayoutConstraint
        let heightConstraint = NSLayoutConstraint(item: mainView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        let widthConstraint = NSLayoutConstraint(item: mainView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        let horizontalConstraint = NSLayoutConstraint(item: mainView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: mainView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        animateMainViewConstraint(widthConstraint: widthConstraint)
        
        layoutIfNeeded()
        
        //titleLabel constraint with cartography
        constrain(mainView, titleLabel) { mainView, titleLabel in
            titleLabel.top == mainView.top
            titleLabel.centerX == mainView.centerX
            titleLabel.centerY == mainView.centerY
            titleLabel.leading == mainView.leading
            titleLabel.trailing == mainView.trailing
        }
        
        //titleLabel constraint with NSlayoutConstraint
        //        NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100).isActive = true
        //        NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
        //        NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: mainView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        //        NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: mainView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        
        
        //profileImageView constraint
        constrain(self, profileImageView) { view, profileImageView in
            
            profileImageView.centerX == view.centerX
            // profileImageView.centerY == view.centerY
            profileImageView.top == view.top + 40
            // profileImageView.topMargin == view.topMargin + 100
            // profileImageView.bottom == view.bottom - 200
            profileImageView.height == 200
            profileImageView.width == 200
            // profileImageView.leading == view.leading + 50
            // profileImageView.trailing == view.trailing - 50
        }
        
    }
    
    func setupAnimation() {
       
        //Add animation to profileImageView
        UIView.animate(withDuration: 2, animations: {
            self.profileImageView.alpha = 1
        }, completion: nil)
        
        
    }
    
    func addInteraction() {
        //add interaction to imageView
        let tapKhabib: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        tapKhabib.numberOfTapsRequired = 1
        profileImageView.addGestureRecognizer(tapKhabib)
        //        profileImageView.isExclusiveTouch = true
        profileImageView.isUserInteractionEnabled = true
    }
    
    // MARK: - Helper
    
    @objc func imageTapped(tapGestureRecognizer: UIGestureRecognizer) {
        titleLabel.text = "Afiq is my great master"
    }
    
    func animateMainViewConstraint(widthConstraint: NSLayoutConstraint) {
        widthConstraint.constant = 300
        mainView.alpha = 0
        
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            self.titleLabel.textColor = UIColor.white
            self.mainView.alpha = 1
            self.mainView.backgroundColor = UIColor.blue
            self.layoutIfNeeded()
        }, completion: nil)
        
    }

    
}
