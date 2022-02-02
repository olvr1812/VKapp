//
//  AllFriendsController.swift
//  VKapp
//
//  Created by Оливер Салихов on 23.01.2022.
//

import UIKit



class AllFriendsController: UITableViewController {
    
    
    @IBOutlet var friendsTableView: UITableView!
    
    
    var friendsCellList: [friendsLabel] = [.init(name: "Simba", photo: "1"),
                                           .init(name: "Hercules", photo: "2"),
                                           .init(name: "James P. Sallyvan", photo: "3"),
                                           .init(name: "Stuart Little", photo: "4"),
                                           .init(name: "Mike Vazovsky", photo: "5")]
    
    private let firendProfileIdentifire = "friendsProfile"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear = false
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        friendsTableView.rowHeight = 72
        
        registerTableView()
    }

    // MARK: - Table view data source
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return friendsCellList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCellID", for: indexPath) as! AllFriendsCell
        // Получаем имя друга для конкретной строки
        let cellFriendInfo = friendsCellList[indexPath.row]

        // Устанавливаем имя друга в надпись ячейки
        cell.infoInCell(with: cellFriendInfo)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cellFriendInfo = friendsCellList[indexPath.row]
        performSegue(withIdentifier: "friendPriofile", sender: cellFriendInfo)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            friendsCellList.remove(at: indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "friendPriofile" {
            
            guard let collectionViewController = segue.destination as? PhotosCollectionViewController, let cellFriendInfo = sender as? friendsLabel else {return}
            if cellFriendInfo.name == "Simba" {
                collectionViewController.userInfo = [
                    .init(name: "Simba", photo: "simb1"),
                    .init(name: "Simba", photo: "simb2"),
                    .init(name: "Simba", photo: "simb3")
                ]
            } else if cellFriendInfo.name == "Hercules" {
                collectionViewController.userInfo = [
                    .init(name: "Hercules", photo: "herc1"),
                    .init(name: "Hercules", photo: "herc2"),
                    .init(name: "Hercules", photo: "herc3"),
                    .init(name: "Hercules", photo: "herc4")]
            } else if cellFriendInfo.name == "James P. Sallyvan" {
                collectionViewController.userInfo = [
                    .init(name: "James P. Sallyvan", photo: "sal1"),
                    .init(name: "James P. Sallyvan", photo: "sal2"),
                    .init(name: "James P. Sallyvan", photo: "sal3")]
            } else if cellFriendInfo.name == "Stuart Little" {
                collectionViewController.userInfo = [
                    .init(name: "Stuart Little", photo: "lit1"),
                    .init(name: "Stuart Little", photo: "lit2"),
                    .init(name: "Stuart Little", photo: "lit3")]
            } else if cellFriendInfo.name == "Mike Vazovsky" {
                collectionViewController.userInfo = [
                    .init(name: "Mike Vazovsky", photo: "mik1"),
                    .init(name: "Mike Vazovsky", photo: "mik2"),
                    .init(name: "Mike Vazovsky", photo: "mik3")]
            }
            collectionViewController.userInfo.append(cellFriendInfo)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Friends"
    }

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
    func registerTableView() {
        tableView.register(AllFriendsCell.nib(), forCellReuseIdentifier: "friendCellID")
    }
}
