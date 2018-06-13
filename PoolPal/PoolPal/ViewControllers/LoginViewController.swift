//
//  ViewController.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/4/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        print("successfully logged into facebook")
        goToNextView(loginButton)
    }
    
    let loginButton = FBSDKLoginButton()
    var gradientLayer: CAGradientLayer!
//    var nextView = PoolsTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.delegate = self
        createGradiantLayer()
        self.view.addSubview(loginButton)
        view.bringSubview(toFront: loginButton)
        setupView()
    }
    
    func createGradiantLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        gradientLayer.colors = [UIColor.mainRed().cgColor, UIColor.mainWhite().cgColor]
        self.view.layer.addSublayer(gradientLayer)
    }
    
    lazy var poolPalLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Pool Pal"
        lbl.font = UIFont(name: "Times New Roman", size: 50)
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var signInLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Please sign in"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Times New Roman", size: 25)
        return lbl
    }()
    
    lazy var emailTextField: UITextField = {
        let utf = UITextField()
        utf.backgroundColor = UIColor.mainWhite()
        utf.placeholder = "Username"
        return utf
    }()
    
    lazy var passwordTextField: UITextField = {
        let fntf = UITextField()
        fntf.backgroundColor = UIColor.mainWhite()
        fntf.placeholder = "First name"
        return fntf
    }()
    
    lazy var signInButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.redComplement1(), for: .normal)
        btn.setTitle("Sign In", for: .normal)
        btn.backgroundColor = UIColor.mainGray()
        btn.addTarget(self, action: #selector(goToNextView(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var orLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "or"
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var signUpButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.redComplement1(), for: .normal)
        btn.setTitle("Sign Up", for: .normal)
        btn.addTarget(self, action: #selector(goToNextView(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var accountLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Need an account?"
        lbl.textColor = UIColor.mainGray()
        return lbl
    }()
    
    @objc func goToNextView(_ sender: UIButton) {
            if sender == signUpButton {
            let nextView = SignUpViewController()
            self.navigationController?.show(nextView, sender: self)
            } else if sender == loginButton {
            let nextView = PoolsTableViewController()
            self.navigationController?.show(nextView, sender: self)
            } else if sender == signInButton {
            let nextView = PoolsTableViewController()
            self.navigationController?.show(nextView, sender: self)
        }
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(signUpButton)
        view.addSubview(accountLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(orLabel)
        view.addSubview(poolPalLabel)
        view.addSubview(signInLabel)
        view.addSubview(signInButton)
        loginButton.viewWithTag(3)
        signInButton.viewWithTag(2)
        signUpButton.viewWithTag(1)
        
        signInButton.anchor(top: passwordTextField.bottomAnchor,
                            left: view.leftAnchor,
                            bottom: nil,
                            right: view.rightAnchor,
                            paddingTop: 8,
                            paddingLeft: 50,
                            paddingBottom: 0,
                            paddingRight: 50,
                            width: 0,
                            height: 0)
        
        poolPalLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                            left: view.leftAnchor,
                            bottom: nil,
                            right: view.rightAnchor,
                            paddingTop: view.frame.height / 8,
                            paddingLeft: 50,
                            paddingBottom: 0,
                            paddingRight: 50,
                            width: 0,
                            height: 0)
        
        signInLabel.anchor(top: poolPalLabel.bottomAnchor,
                           left: view.leftAnchor,
                           bottom: nil,
                           right: view.rightAnchor,
                           paddingTop: view.frame.height / 5,
                           paddingLeft: 50,
                           paddingBottom: 0,
                           paddingRight: 50,
                           width: 0,
                           height: 0)
        
        emailTextField.anchor(top: poolPalLabel.bottomAnchor,
                                 left: view.leftAnchor,
                                 bottom: nil,
                                 right: view.rightAnchor,
                                 paddingTop: view.frame.height / 4,
                                 paddingLeft: 50,
                                 paddingBottom: 0,
                                 paddingRight: 50,
                                 width: 0,
                                 height: 30)
        
        passwordTextField.anchor(top: emailTextField.bottomAnchor,
                                  left: view.leftAnchor,
                                  bottom: nil,
                                  right: view.rightAnchor,
                                  paddingTop: 8,
                                  paddingLeft: 50,
                                  paddingBottom: 0,
                                  paddingRight: 50,
                                  width: 0,
                                  height: 30)
        
        orLabel.anchor(top: signInButton.bottomAnchor,
                       left: view.leftAnchor,
                       bottom: nil,
                       right: view.rightAnchor,
                       paddingTop: 8,
                       paddingLeft: 150,
                       paddingBottom: 0,
                       paddingRight: 150,
                       width: 0,
                       height: 0)
        
        loginButton.anchor(top: orLabel.bottomAnchor,
                           left: view.leftAnchor,
                           bottom: nil,
                           right: view.rightAnchor,
                           paddingTop: 8,
                           paddingLeft: 50,
                           paddingBottom: 0,
                           paddingRight: 50,
                           width: 0,
                           height: 0)
        
        signUpButton.anchor(top: nil,
                            left: nil,
                            bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            right: view.safeAreaLayoutGuide.rightAnchor,
                            paddingTop: 0,
                            paddingLeft: 0,
                            paddingBottom: 0,
                            paddingRight: view.frame.width / 2 - 100,
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

