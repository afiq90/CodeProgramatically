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
        return view
    }()
    
//    var newView: UIView {
//        let newView = UIView()
//        newView.backgroundColor = UIColor.red
//        return newView
//    }

    
    override func viewDidLayoutSubviews() {
        view.backgroundColor = UIColor.gray
//        view.addSubview(mainView)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupmainViewAutoLayout()
        

    }

    func setupmainViewAutoLayout() {
       
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
    
//        let mainView = UIView()
        mainView.backgroundColor = UIColor.green
        view.addSubview(mainView)
    
        mainView.translatesAutoresizingMaskIntoConstraints = false

        let horizontalConstraint = NSLayoutConstraint(item: mainView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: mainView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: mainView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        let heightConstraint = NSLayoutConstraint(item: mainView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)

        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        view.layoutIfNeeded()

    }


}

