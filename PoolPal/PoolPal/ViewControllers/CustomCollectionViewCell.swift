//
//  CustomCollectionViewCell.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/18/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func willTransition(from oldLayout: UICollectionViewLayout, to newLayout: UICollectionViewLayout) {
        
    }
    
    
    let nameTextField: UITextField = {
        let ntf = UITextField()
        ntf.placeholder = "Enter players name"
        return ntf
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
