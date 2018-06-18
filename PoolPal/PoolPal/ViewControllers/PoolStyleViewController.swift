//
//  PoolStyleViewController.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/6/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import UIKit

class PoolStyleViewController: UIViewController {
    
    var nextView = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Navigation
    
    @objc func goToNextView(sender: UIButton) {
        switch sender {
        case squaresButton:
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let nextView = SquaresCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
            self.nextView = nextView
        case straightBetButton:
            let nextView = StraightBetViewController()
            self.nextView = nextView
        case bracketButton:
            let nextView = BracketCollectionViewController()
            self.nextView = nextView
        default:
            let nextView = PoolsTableViewController()
            self.nextView = nextView
        }
        print("\(nextView)")
        self.navigationController?.show(nextView, sender: self)
    }

    lazy var styleLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = UIColor.mainGray()
        lbl.textColor = UIColor.mainWhite()
        lbl.text = "Pick a betting style"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Times New Roman", size: 35)
        return lbl
    }()
    
    lazy var squaresButton: UIButton = {
       let btn = UIButton()
        btn.setTitle("Squares", for: .normal)
        btn.backgroundColor = UIColor.mainGray()
        btn.setTitleColor(.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(goToNextView(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var bracketButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Bracket", for: .normal)
        btn.backgroundColor = UIColor.mainGray()
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(goToNextView(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var pickEmButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Pick Em'", for: .normal)
        btn.backgroundColor = UIColor.mainGray()
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(goToNextView(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var straightBetButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Straight Bet", for: .normal)
        btn.backgroundColor = UIColor.mainGray()
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(goToNextView(sender:)), for: .touchUpInside)
        return btn
    }()
    
    func setupUI() {
        self.view.addSubview(squaresButton)
        self.view.addSubview(straightBetButton)
        self.view.addSubview(bracketButton)
        self.view.addSubview(pickEmButton)
        self.view.addSubview(styleLabel)
        self.view.backgroundColor = UIColor.mainRed()

        styleLabel.anchor(top: view.topAnchor,
                          left: view.leftAnchor,
                          bottom: nil,
                          right: view.rightAnchor,
                          paddingTop: view.frame.height / 8,
                          paddingLeft: view.frame.width / 8,
                          paddingBottom: 0,
                          paddingRight: view.frame.width / 8,
                          width: 0,
                          height: 50)
        
        squaresButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                             left: view.leftAnchor,
                             bottom: nil,
                             right: view.rightAnchor,
                             paddingTop: view.frame.height / 5,
                             paddingLeft: view.frame.width / 5,
                             paddingBottom: 0,
                             paddingRight: view.frame.width / 5,
                             width: 0,
                             height: 0)
        
        bracketButton.anchor(top: squaresButton.bottomAnchor,
                             left: view.leftAnchor,
                             bottom: nil,
                             right: view.rightAnchor,
                             paddingTop: 8,
                             paddingLeft: view.frame.width / 5,
                             paddingBottom: 0,
                             paddingRight: view.frame.width / 5,
                             width: 0,
                             height: 0)
        
        pickEmButton.anchor(top: bracketButton.bottomAnchor,
                             left: view.leftAnchor,
                             bottom: nil,
                             right: view.rightAnchor,
                             paddingTop: 8,
                             paddingLeft: view.frame.width / 5,
                             paddingBottom: 0,
                             paddingRight: view.frame.width / 5,
                             width: 0,
                             height: 0)
        
        straightBetButton.anchor(top: pickEmButton.bottomAnchor,
                             left: view.leftAnchor,
                             bottom: nil,
                             right: view.rightAnchor,
                             paddingTop: 8,
                             paddingLeft: view.frame.width / 5,
                             paddingBottom: 0,
                             paddingRight: view.frame.width / 5,
                             width: 0,
                             height: 0)
    }
}
