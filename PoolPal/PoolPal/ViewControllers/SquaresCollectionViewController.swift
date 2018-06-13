//
//  SquaresCollectionViewController.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/7/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SquaresCollectionViewController: UICollectionViewController {

    let layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
//        collectionView?.backgroundColor = .green
        // Register cell classes
        navigationController?.navigationBar.barTintColor = UIColor.mainRed()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(savePool(_:)))
        
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func savePool(_ sender: UIBarButtonItem) {
        print("pool saved")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 50, height: 50)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let spacing = CGFloat(1.0)
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSpringLoadItemAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        var selectedCell = SquaresCollectionViewController.index(ofAccessibilityElement: indexPath)
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) 
        cell.backgroundColor = .yellow
        
        return cell
    }
    
//    func animateZoomforCell(zoomCell: UICollectionViewCell)
//    {
//        UIView.animate(
//            withDuration: 0.2,
//            delay: 0,
//            options: UIViewAnimationOptions.curveEaseOut,
//            animations: {
//                zoomCell.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
//        },
//            completion: nil)
//    }
//
//    func animateZoomforCellremove(zoomCell: UICollectionViewCell)
//    {
//        UIView.animate(
//            withDuration: 0.2,
//            delay: 0,
//            options: UIViewAnimationOptions.curveEaseOut,
//            animations: {
//                zoomCell.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
//        },
//            completion: nil)
//    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }
*/
    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return true
    }

//    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
////        let item = indexPath.item
//        let action = animateZoomforCell(zoomCell:)
//
//    }
}
