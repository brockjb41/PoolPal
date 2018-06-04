//
//  ViewController.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/4/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var gradientLayer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGradiantLayer()
        setupView()
    }
    
    func createGradiantLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        gradientLayer.colors = [UIColor.mainRed().cgColor, UIColor.mainWhite().cgColor]
        self.view.layer.addSublayer(gradientLayer)
    }
    
//    lazy var fourthChoiceButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.backgroundColor = UIColor.mainWhite()
//        button.setTitle("Topic", for: .normal)
//        button.setTitleColor(UIColor.mainRed(), for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 27)
//        button.layer.masksToBounds = true
//        button.frame = CGRect(x: self.view.frame.width/4 - 50, y: self.view.frame.height/4 + 300, width: self.view.frame.width/2 + 100, height: 100)
//        button.layer.borderColor = UIColor.black.cgColor
//        button.layer.borderWidth = 2.0
//        return button
//    }()
    
    lazy var signUpButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.redComplement1(), for: .normal)
        btn.setTitle("Sign Up", for: .normal)
//        btn.backgroundColor = UIColor.redComplement1()
        return btn
    }()
    
    lazy var accountLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Need an account?"
        lbl.textColor = UIColor.mainGray()
        return lbl
    }()
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(signUpButton)
        view.addSubview(accountLabel)
//        view.bringSubview(toFront: signUpButton)
        
        signUpButton.anchor(top: nil,
                            left: nil,
                            bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            right: view.safeAreaLayoutGuide.rightAnchor,
                            paddingTop: 0,
                            paddingLeft: 0,
                            paddingBottom: 0,
                            paddingRight: view.frame.width / 2 - 70,
                            width: 0,
                            height: 0)
        
        accountLabel.anchor(top: nil,
                            left: nil,
                            bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            right: signUpButton.leftAnchor,
                            paddingTop: 0,
                            paddingLeft: 0,
                            paddingBottom: -7,
                            paddingRight: 5,
                            width: 0,
                            height: 0)
        
    }

}

