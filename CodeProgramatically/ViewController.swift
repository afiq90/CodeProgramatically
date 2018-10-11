//
//  ViewController.swift
//  CodeProgramatically
//
//  Created by Afiq Hamdan on 10/10/18.
//  Copyright © 2018 Afiq Hamdan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView: UIView = {
//        let view = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Xcode Awesome"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLayoutSubviews() {
        view.backgroundColor = UIColor.gray
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupmainViewAutoLayout()
        setupLabel()
        
        guard let xx = titleLabel.text else {return}
        print("label text ; \(String(describing: xx))")
    }
    
    func setupLabel() {
        mainView.addSubview(titleLabel)
        
        //label constraint
        
        NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: mainView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: mainView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
    }

    func setupmainViewAutoLayout() {
        
        view.addSubview(mainView)
        
        let heightConstraint = NSLayoutConstraint(item: mainView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        let widthConstraint = NSLayoutConstraint(item: mainView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        let horizontalConstraint = NSLayoutConstraint(item: mainView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: mainView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint(item: mainView, attribute: ., relatedBy: <#T##NSLayoutRelation#>, toItem: <#T##Any?#>, attribute: <#T##NSLayoutAttribute#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>)
        
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

    func animateMainViewConstraint(widthConstraint: NSLayoutConstraint) {
        widthConstraint.constant = 300
        mainView.alpha = 0

        UIView.animate(withDuration: 1.0, animations: {
            self.titleLabel.textColor = UIColor.white
            self.mainView.alpha = 1
            self.mainView.backgroundColor = UIColor.blue
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

}

