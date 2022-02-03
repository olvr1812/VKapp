//
//  AllFriendsController.swift
//  VKapp
//
//  Created by Оливер Салихов on 23.01.2022.
//

import UIKit



class AllFriendsController: UITableViewController {
    
    
    @IBOutlet var friendsTableView: UITableView!
    
    
//    var friendsCellList: [friendsLabel] = [
//        .init(name: "Asterix", surname: "", photo: "1"),
//        .init(name: "Hercules", surname: "", photo: "2"),
//        .init(name: "James P.", surname: "Sallyvan", photo: "3"),
//        .init(name: "Simba", surname: "", photo: "1"),
//        .init(name: "Bart", surname: "Simpson", photo: "1"),
//        .init(name: "Homer", surname: "Simpson", photo: "1"),
//        .init(name: "Liza", surname: "Simpson", photo: "1"),
//        .init(name: "Marge", surname: "Simpson", photo: "1"),
//        .init(name: "Mo", surname: "Szyslak", photo: "1"),
//        .init(name: "Stuart", surname: "Little", photo: "4"),
//        .init(name: "Lighting", surname: "McQueen", photo: "1"),
//        .init(name: "Sailor", surname: "Moon", photo: "1"),
//        .init(name: "Mufasa", surname: "", photo: "1"),
//        .init(name: "Mike", surname: "Vazovsky", photo: "5")
//    ]
    
    var friendsCellList_A: [friendsLabel] = [.init(name: "Asterix", surname: "", photo: "1")]
    
    var friendsCellList_H: [friendsLabel] = [
        .init(name: "Hercules", surname: "", photo: "2"),
    ]
    
    var friendsCellList_S: [friendsLabel] = [
        .init(name: "James P.", surname: "Sallyvan", photo: "3"),
        .init(name: "Bart", surname: "Simpson", photo: "3"),
        .init(name: "Homer", surname: "Simpson", photo: "3"),
        .init(name: "Liza", surname: "Simpson", photo: "3"),
        .init(name: "Marge", surname: "Simpson", photo: "3"),
        .init(name: "Mo", surname: "Szyslak", photo: "1")
    ]
    
    var friendsCellList_L: [friendsLabel] = [
        .init(name: "Stuart", surname: "Little", photo: "4")
    ]
    
    var friendsCellList_M: [friendsLabel] = [
        .init(name: "Lighting", surname: "McQueen", photo: "1"),
        .init(name: "Sailor", surname: "Moon", photo: "1"),
        .init(name: "Mufasa", surname: "", photo: "1")
    ]
    
    var friendsCellList_V: [friendsLabel] = [
        .init(name: "Mike", surname: "Vazovsky", photo: "5")
    ]
    
    var friendCellError: [friendsLabel] = [.init (name: "Error", surname: "Error", photo: "1")]
    
    let numberOfSection = 5
    

    
    private let firendProfileIdentifire = "friendsProfile"
    private let friendHeaderIdentifier = "headerForFriendListID"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear = false
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        friendsTableView.rowHeight = 72
        
        registerTableView()
        registerHeaderTableView()
    }

    // MARK: - Table view data source
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return numberOfSection
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowCount = 0
        
        switch (section) {
        case 0:
            rowCount = friendsCellList_A.count
        case 1:
            rowCount = friendsCellList_H.count
        case 2:
            rowCount = friendsCellList_L.count
        case 3:
            rowCount = friendsCellList_M.count
        case 4:
            rowCount = friendsCellList_S.count
        case 5:
            rowCount = friendsCellList_V.count
        default:
            rowCount = 0
        }

        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCellID", for: indexPath) as! AllFriendsCell
        // Получаем имя друга для конкретной строки
        
        switch (indexPath.section) {
        case 0:
            cell.infoInCell(with: friendsCellList_A[indexPath.row])
        case 1:
            cell.infoInCell(with: friendsCellList_H[indexPath.row])
        case 2:
            cell.infoInCell(with: friendsCellList_L[indexPath.row])
        case 3:
            cell.infoInCell(with: friendsCellList_M[indexPath.row])
        case 4:
            cell.infoInCell(with: friendsCellList_S[indexPath.row])
        case 5:
            cell.infoInCell(with: friendsCellList_V[indexPath.row])
        default:
            cell.infoInCell(with: friendCellError[indexPath.row])
        }

        // Устанавливаем имя друга в надпись ячейки
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cellFriendInfo = friendsCellList_S[indexPath.row]
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
            
            friendsCellList_S.remove(at: indexPath.row)
            
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
                    .init(name: "Simba", surname: "", photo: "simb1"),
                    .init(name: "Simba", surname: "", photo: "simb2"),
                    .init(name: "Simba", surname: "", photo: "simb3")
                ]
            } else if cellFriendInfo.name == "Hercules" {
                collectionViewController.userInfo = [
                    .init(name: "Hercules", surname: "", photo: "herc1"),
                    .init(name: "Hercules", surname: "", photo: "herc2"),
                    .init(name: "Hercules", surname: "", photo: "herc3"),
                    .init(name: "Hercules", surname: "", photo: "herc4")]
            } else if cellFriendInfo.name == "James P." {
                collectionViewController.userInfo = [
                    .init(name: "James P. Sallyvan", surname: "", photo: "sal1"),
                    .init(name: "James P. Sallyvan", surname: "", photo: "sal2"),
                    .init(name: "James P. Sallyvan", surname: "", photo: "sal3")]
            } else if cellFriendInfo.name == "Stuart" {
                collectionViewController.userInfo = [
                    .init(name: "Stuart Little", surname: "", photo: "lit1"),
                    .init(name: "Stuart Little", surname: "", photo: "lit2"),
                    .init(name: "Stuart Little", surname: "", photo: "lit3")]
            } else if cellFriendInfo.name == "Mike" {
                collectionViewController.userInfo = [
                    .init(name: "Mike Vazovsky", surname: "", photo: "mik1"),
                    .init(name: "Mike Vazovsky", surname: "", photo: "mik2"),
                    .init(name: "Mike Vazovsky", surname: "", photo: "mik3")]
            }
            collectionViewController.userInfo.append(cellFriendInfo)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: friendHeaderIdentifier) as! HeaderForCellViewController
        
        switch (section) {
        case 0:
            headerCell.headerLabel.text = "A"
        case 1:
            headerCell.headerLabel.text = "H"
        case 2:
            headerCell.headerLabel.text = "L"
        case 3:
            headerCell.headerLabel.text = "M"
        case 4:
            headerCell.headerLabel.text = "S"
        case 5:
            headerCell.headerLabel.text = "V"
        default:
            headerCell.headerLabel.text = "Error"
        }
        
        return headerCell
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Friends"
//    }

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


private extension AllFriendsController {
    func registerHeaderTableView() {
        tableView.register(HeaderForCellViewController.nibb(), forCellReuseIdentifier: "headerForFriendListID")
    }
}
