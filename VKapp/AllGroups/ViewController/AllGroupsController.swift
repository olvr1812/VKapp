//
//  AllGroupsController.swift
//  VKapp
//
//  Created by Оливер Салихов on 24.01.2022.
//

import UIKit

class AllGroupsController: UITableViewController {
    
    let cellGroupID = "cellGroupID"
    
    @IBOutlet var allGroupsTableView: UITableView!
    
    
    var all_groups: [infoGroupInView] = [.init(name: "News", image: "news"),
                                         .init(name: "Kittys", image: "kotiki"),
                                         .init(name: "Healthy Lifestyle", image: "zog"),
                                         .init(name: "Scandals", image: "scandal"),
                                         .init(name: "KriptoNews", image: "kripta")]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return all_groups.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellGroupID, for: indexPath) as! AllGroupCell
        
        let data = all_groups[indexPath.row]
        
        
        
        cell.infoInCell(with: data)

        // Configure the cell...

        return cell
    }

}
