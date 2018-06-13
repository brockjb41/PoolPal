//
//  SignUpViewController.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/10/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        self.view.backgroundColor = UIColor.mainRed()
        // Do any additional setup after loading the view.
    }
    
    lazy var createAccountLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Create an account"
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Enter email here"
        return tf
    }()
    
    lazy var usernameTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Enter username here"
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Enter password here"
        return tf
    }()
    
    lazy var passwordConfirmationTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Confirm password"
        return tf
    }()
    
    lazy var createAccountButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Create Account", for: .normal)
        btn.addTarget(self, action: #selector(goToNextView(_:)), for: .touchUpInside)
        return btn
    }()
    
    @objc func goToNextView(_ sender: UIButton) {
        let nextView = PoolsTableViewController()
        self.navigationController?.show(nextView, sender: self)
    }
    
    func setupView() {
        view.addSubview(createAccountLabel)
        view.addSubview(emailTextField)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(passwordConfirmationTextField)
        view.addSubview(createAccountButton)
        
        createAccountLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                  left: view.leftAnchor,
                                  bottom: nil,
                                  right: view.rightAnchor,
                                  paddingTop: view.frame.height/5,
                                  paddingLeft: 50,
                                  paddingBottom: 0,
                                  paddingRight: 50,
                                  width: 0,
                                  height: 0)
        
        emailTextField.anchor(top: createAccountLabel.bottomAnchor,
                              left: view.leftAnchor,
                              bottom: nil,
                              right: view.rightAnchor,
                              paddingTop: view.frame.height / 5,
                              paddingLeft: 50,
                              paddingBottom: 0,
                              paddingRight: 50,
                              width: 0,
                              height: 0)
        
        usernameTextField.anchor(top: emailTextField.bottomAnchor,
                                 left: view.leftAnchor,
                                 bottom: nil,
                                 right: view.rightAnchor,
                                 paddingTop: 8,
                                 paddingLeft: 50,
                                 paddingBottom: 0,
                                 paddingRight: 50,
                                 width: 0,
                                 height: 0)
        
        passwordTextField.anchor(top: usernameTextField.bottomAnchor,
                                 left: view.leftAnchor,
                                 bottom: nil,
                                 right: view.rightAnchor,
                                 paddingTop: 8,
                                 paddingLeft: 50,
                                 paddingBottom: 0,
                                 paddingRight: 50,
                                 width: 0,
                                 height: 0)
        
        passwordConfirmationTextField.anchor(top: passwordTextField.bottomAnchor,
                                             left: view.leftAnchor,
                                             bottom: nil,
                                             right: view.rightAnchor,
                                             paddingTop: 8,
                                             paddingLeft: 50,
                                             paddingBottom: 0,
                                             paddingRight: 50,
                                             width: 0,
                                             height: 0)
        
        createAccountButton.anchor(top: passwordConfirmationTextField.bottomAnchor,
                                   left: view.leftAnchor,
                                   bottom: nil,
                                   right: view.rightAnchor,
                                   paddingTop: 8,
                                   paddingLeft: 50,
                                   paddingBottom: 0,
                                   paddingRight: 50,
                                   width: 0,
                                   height: 0)
    }
}
