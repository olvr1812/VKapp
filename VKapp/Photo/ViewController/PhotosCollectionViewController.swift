//
//  PhotosCollectionViewController.swift
//  VKapp
//
//  Created by Оливер Салихов on 24.01.2022.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var newView: UIView!
    
    var userInfo = [friendsLabel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = URLComponents()
        
        url.scheme = "https"
        url.host = "api.vk.com"
        url.path = "/method/photos.get"
        url.queryItems = [
            URLQueryItem(name: "access_token", value: Session.session.token),
            URLQueryItem(name: "owner_id", value: "\(Session.session.userId)"),
            URLQueryItem(name: "album_id", value: "profile"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "count", value: "10"),
            URLQueryItem(name: "v", value: "5.131")
        ]d
        
        var request = URLRequest(url: url.url!)
        
        request.httpMethod = "GET"
        
        
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { data, respone, error in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) else { return }
            
            print(json)
        }
        
        task.resume()
        
    }

    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return userInfo.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell() }
        
        let profileInfo = userInfo[indexPath.row]
        cell.infoInCell(with: profileInfo)
        
        
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate


    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

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

    
    
}
