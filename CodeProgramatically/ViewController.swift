//
//  ViewController.swift
//  CodeProgramatically
//
//  Created by Afiq Hamdan on 10/10/18.
//  Copyright © 2018 Afiq Hamdan. All rights reserved.
//

import UIKit
import Cartography

class ViewController: UIViewController {
    
    let mainView: UIView = {
//        let view = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
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
    
    override func viewDidLayoutSubviews() {
        view.backgroundColor = UIColor.gray
//        self.profileImageView.layer.masksToBounds = true
        self.profileImageView.layer.borderWidth = 2.0
//        self.profileImageView.layer.cornerRadius = self.profileImageView.bounds.size.height / 2
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2

        self.profileImageView.clipsToBounds = true
        print("imageview width : \(self.profileImageView.frame.size.width)")

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupmainViewWithAutolayoutAndAnimation()
        setupLabelWithAutolayoutAndAnimation()
        addKhabibImageAutolayoutAndAnimation()
        
        guard let xx = titleLabel.text else {return}
        print("label text ; \(String(describing: xx))")
    }
    
    func setupmainViewWithAutolayoutAndAnimation() {
        
        view.addSubview(mainView)
        
        let heightConstraint = NSLayoutConstraint(item: mainView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        let widthConstraint = NSLayoutConstraint(item: mainView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        let horizontalConstraint = NSLayoutConstraint(item: mainView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: mainView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        animateMainViewConstraint(widthConstraint: widthConstraint)
        
        view.layoutIfNeeded()
       
//        let newView = UIView()
//        newView.backgroundColor = UIColor.red
//        view.addSubview(newView)
        
//        newView.translatesAutoresizingMaskIntoConstraints = false
//
//        let newViewhorizontalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
//        let newViewverticalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
//        let newViewwidthConstraint = NSLayoutConstraint(item: newView, attribute: .width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 200)
//        let newViewheightConstraint = NSLayoutConstraint(item: newView, attribute: .height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 300)
//        view.addConstraints([newViewhorizontalConstraint, newViewverticalConstraint, newViewwidthConstraint, newViewheightConstraint])

    }
    
    func setupLabelWithAutolayoutAndAnimation() {
        mainView.addSubview(titleLabel)
        
        //label constraint
        
        constrain(view, mainView, titleLabel) { view, mainView, titleLabel in
            titleLabel.centerX == mainView.centerX
            titleLabel.centerY == mainView.centerY
            titleLabel.leading == mainView.leading
            titleLabel.trailing == mainView.trailing
        }
        
//        NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100).isActive = true
//        NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
//        NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: mainView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: mainView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
    }
    
    func addKhabibImageAutolayoutAndAnimation() {
        view.addSubview(profileImageView)
        
        //Add animation to profileImageView
        UIView.animate(withDuration: 2, animations: {
            self.profileImageView.alpha = 1
        }, completion: nil)
        
        // Add constraint to profileImageView
        constrain(view, profileImageView) { view, profileImageView in
            profileImageView.centerX == view.centerX
//            profileImageView.centerY == view.centerY
            profileImageView.top == view.top + 40
//            profileImageView.topMargin == view.topMargin + 100
//            profileImageView.bottom == view.bottom - 200
            profileImageView.height == 200
            profileImageView.width == 200
//            profileImageView.leading == view.leading + 50
//            profileImageView.trailing == view.trailing - 50
        }
        
        
        //add interaction to imageView
        let tapKhabib: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        tapKhabib.numberOfTapsRequired = 1
        profileImageView.addGestureRecognizer(tapKhabib)
//        profileImageView.isExclusiveTouch = true
        profileImageView.isUserInteractionEnabled = true

        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UIGestureRecognizer) {
        titleLabel.text = "Afiq is my great master"
        print("tapped khabib")
    }

    func animateMainViewConstraint(widthConstraint: NSLayoutConstraint) {
        widthConstraint.constant = 300
        mainView.alpha = 0

        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            self.titleLabel.textColor = UIColor.white
            self.mainView.alpha = 1
            self.mainView.backgroundColor = UIColor.blue
            self.view.layoutIfNeeded()
        }, completion: nil)
    
    }

}

