//
//  BracketCollectionViewController.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/7/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BracketCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setupView()
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
        let isCreator = true
        let style = "Bracket"
        guard let name = poolNameTextField.text, !name.isEmpty else { return }
        PoolController.shared.createPool(name: name, isCreator: isCreator, style: style) { (success) in
            if success {
                DispatchQueue.main.async {
                    self.navigationController?.show(PoolsTableViewController(), sender: nil)
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
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
