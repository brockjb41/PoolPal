//
//  StraightBetViewController.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/7/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import UIKit

class StraightBetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
    }

    lazy var poolNameTextField: UITextField = {
        let pntf = UITextField()
        pntf.text = PoolController.shared.currentPool?.name
        pntf.backgroundColor = .white
        pntf.placeholder = "Enter pool name here"
        pntf.textAlignment = .center
        return pntf
    }()
    
    @objc func savePoolButtonTapped(_ sender: UIBarButtonItem) {
        guard let name = poolNameTextField.text, !name.isEmpty else { return }
        let isCreator = true
        let style = "Sraight Bet"
        PoolController.shared.createPool(name: name, isCreator: isCreator, style: style) { (success) in
            if success {
                DispatchQueue.main.async {
                    self.navigationController?.show(PoolsTableViewController(), sender: nil)
                }
            }
        }
    }
    
    // MARK: - Navigation
    func setupView() {
        view.addSubview(poolNameTextField)
        
        poolNameTextField.anchor(top: nil,
                                 left: view.leftAnchor,
                                 bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                 right: view.rightAnchor,
                                 paddingTop: 0,
                                 paddingLeft: 50,
                                 paddingBottom: -20,
                                 paddingRight: 50,
                                 width: 0,
                                 height: 50)
    }
}
