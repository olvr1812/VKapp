//
//  AllFriendsController.swift
//  VKapp
//
//  Created by Оливер Салихов on 23.01.2022.
//

import UIKit

class AllFriendsController: UITableViewController {
    
    var friendsCellList: [friendsLabel] = [.init(name: "Hohn Kennedy", photo: "1"),
                                           .init(name: "Karaline Luis", photo: "2"),
                                           .init(name: "Jack Rassel", photo: "3"),
                                           .init(name: "Don Karleone", photo: "4"),
                                           .init(name: "Sindy MakMilan", photo: "5")]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
        setupTableView()
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return friendsCellList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: AllFriendsCell.cellId, for: indexPath) as! AllFriendsCell
        // Получаем имя друга для конкретной строки
        let cellFriend = friendsCellList[indexPath.row]

        // Устанавливаем имя друга в надпись ячейки
        cell.setData(with: cellFriend)

        return cell
    }
    
    
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

private extension AllFriendsController {
    func registerTableViewCells() {
        tableView.register(AllFriendsCell.nib(), forCellReuseIdentifier: AllFriendsCell.cellId)
    }
    
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.rowHeight = 72
    }
}
