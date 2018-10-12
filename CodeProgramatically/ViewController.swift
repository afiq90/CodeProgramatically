//
//  ViewController.swift
//  CodeProgramatically
//
//  Created by Afiq Hamdan on 10/10/18.
//  Copyright © 2018 Afiq Hamdan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView: ProfileView! {
        return self.view as! ProfileView
    }
    
    override func loadView() {
        self.view = ProfileView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLayoutSubviews() {
        view.backgroundColor = UIColor.gray
//        self.profileImageView.layer.masksToBounds = true
        mainView.profileImageView.layer.borderWidth = 2.0
        mainView.profileImageView.layer.cornerRadius = mainView.profileImageView.frame.size.width / 2
        mainView.profileImageView.clipsToBounds = true
        print("imageview width : \(mainView.profileImageView.frame.size.width)")

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
 
    


   
}

