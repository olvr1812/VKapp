//
//  PhotoCollectionViewCell.swift
//  VKapp
//
//  Created by Оливер Салихов on 24.01.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var FriendPhoto: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    func infoInCell(with info: friendsLabel) {
        labelName.text = info.name
        FriendPhoto.image = UIImage(named: info.photo)
        
        FriendPhoto.layer.borderWidth = 2
        FriendPhoto.layer.borderColor = UIColor.black.cgColor
        FriendPhoto.layer.cornerRadius = 130
        FriendPhoto.layer.masksToBounds = true
        
        FriendPhoto.layer.shadowColor = UIColor.red.cgColor
        FriendPhoto.layer.shadowOpacity = 100
        FriendPhoto.layer.shadowRadius = 100
        FriendPhoto.layer.shadowOffset = CGSize.init(width: 200, height: 200)
        

    }
    
    
    
    
}
