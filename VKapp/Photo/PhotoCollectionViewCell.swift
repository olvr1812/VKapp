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
    }
    
    
    
    
}
