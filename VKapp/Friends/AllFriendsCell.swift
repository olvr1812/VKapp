//
//  AllFriendsCell.swift
//  VKapp
//
//  Created by Оливер Салихов on 23.01.2022.
//

import UIKit

class AllFriendsCell: UITableViewCell {

    @IBOutlet private var friendName: UILabel!
    @IBOutlet private var friendImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func infoInCell(with info: friendsLabel) {
        friendName.text = info.name
        friendImage.image = UIImage(named: info.photo)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
