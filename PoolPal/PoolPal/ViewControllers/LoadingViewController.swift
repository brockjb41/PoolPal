//
//  SignUpViewController.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/10/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func setupView() {
        
        UserController.shared.fetchCurrentUser { (success) in
            if success {
                PoolController.shared.fetchPools(completion: { (success) in
                    if success {
                        DispatchQueue.main.async {
                            let poolsTVC = PoolsTableViewController()
                            self.navigationController?.pushViewController(poolsTVC, animated: false)
                        }
                    }
                })
            }
            
            if !success {
                let nextView = LoginViewController()
                self.navigationController?.pushViewController(nextView, animated: true)
            }
        }
    }
}
