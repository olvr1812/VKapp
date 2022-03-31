//
//  GroupsViewController.swift
//  VKapp
//
//  Created by Оливер Салихов on 23.01.2022.
//

import UIKit

class GroupsViewController: UITableViewController {
    
    
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        
        // Проверяем идентификатор, чтобы убедиться, что это нужный переход
        if segue.identifier == "addGroup" {
            
            
            // Получаем ссылку на контроллер, с которого осуществлен переход
            let allGroupsController = segue.source as! AllGroupsController
            
            // Получаем индекс выделенной ячейки
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                
                // Получаем город по индексу
                let data = allGroupsController.all_groups[indexPath.row]
                
                if !groupsForWork.contains(data.name) {
                    
                    // Добавляем имя группы в список выбранных групп
                    groupsForWork.append(data.name)
                    
                    //Добовляем имя группы и имя картинки
                    dataGroup.append(data)
                    
                    // Обновляем таблицу
                    tableView.reloadData()
                }
            }
        }
    }
    
    var groupsForWork = [String]()
    
    
    
    var groups = [Group]() {
        didSet {
//            for group in groups where group.name != "DELETED" {
//                print(group.name)
//                groupsDict.removeAll()
//                groups.sort()
//                print(groups)
//                for i in groups.indices {
//                    let letterKey = String((groups[i].name).prefix(1))
//                    if var groupsOnLetterKey = groupsDict[letterKey] {
//                        groupsOnLetterKey.append(groups[i])
//                        groupsDict[letterKey] = groupsOnLetterKey
//                    } else {
//                        groupsDict[letterKey] = [groups[i]]
//                    }
//                }
//                groupsSectionName = [String](groupsDict.keys).sorted(by: { $0 < $1 })
//            }
            DispatchQueue.main.async {
                self.groupsFiltDict = self.groups.sorted()
                print(self.groupsFiltDict)
                self.tableView.reloadData()
            }
        }
    }
    
    
    var groupsDict =  [String: [Group]]()
    var dataGroup = [infoGroupInView]()
    var groupsSectionName = [String]()
    var groupsFiltDict = [Group]()
    
    private let networkFuncs = NetworkFuncs()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkFuncs.getGroups() { [weak self] result in
            switch result {
            case .success(let responseGroups):
                self?.groups = responseGroups.items
            case .failure(let error):
                print(error)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsFiltDict.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else { return UITableViewCell() }
        
        let groupInfos = infoGroupInView(name: groupsFiltDict[indexPath.row].name, image: groupsFiltDict[indexPath.row].photo_50)
//        let group = dataGroup[indexPath.row]
        
        cell.infoInView(with: groupInfos)

        return cell
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
            
            // Удаляем группу из массива
            groups.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
