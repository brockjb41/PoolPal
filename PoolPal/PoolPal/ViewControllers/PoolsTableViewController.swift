//
//  PoolsTableViewController.swift
//  PoolPal
//
//  Created by Brock Boyington on 6/4/18.
//  Copyright © 2018 Brock Boyington. All rights reserved.
//

import UIKit

class PoolsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadUsers() {
        guard let loggedInUser = UserController.shared.loggedInUser else { return }
        navigationItem.title = "\(loggedInUser.username) active pools"
        //self.view.backgroundColor = .green
        navigationController?.navigationBar.barTintColor = UIColor.mainRed()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.goToNextView(_:)))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.reloadData()
    }

    @objc func goToNextView(_ sender: UIButton) {
        let nextView = PoolStyleViewController()
        self.navigationController?.show(nextView, sender: self)
    }

    @objc func showPoolDetail(_ sender: UITableViewCell) {
        
    }
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PoolController.shared.pools.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .yellow
        let pool = PoolController.shared.pools[indexPath.row]
        cell.textLabel?.text = pool.name
        return cell
    }
 
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        showPoolDetail(AnyObject.self)
//    }
//
//    func showPoolDetail(_ sender: Any) {
//        guard let indexPath = tableView.indexPathForSelectedRow else { return }
//        destinationVC.pool = 
//    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
}
