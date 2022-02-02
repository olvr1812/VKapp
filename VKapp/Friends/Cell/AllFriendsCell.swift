//
//  AllFriendsCell.swift
//  VKapp
//
//  Created by Оливер Салихов on 29.01.2022.
//

import UIKit

class AllFriendsCell: UITableViewCell {
    
    static func nib() -> UINib {
        
        return UINib(nibName: "AllFriendsCell", bundle: nil)
    }
    
    @IBOutlet private var friendName: UILabel!
    @IBOutlet private var friendAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func infoInCell(with info: friendsLabel) {
        friendName.text = info.name
        friendAvatar.image = UIImage(named: info.photo)
        
        friendAvatar.frame = CGRect(x: 0, y: 0, width: 72, height: 72)
        friendAvatar.layer.borderWidth = 2
        friendAvatar.layer.borderColor = UIColor.black.cgColor
        friendAvatar.layer.cornerRadius = 35
        friendAvatar.layer.masksToBounds = true
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
