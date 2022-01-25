//
//  AllFriendsCell.swift
//  VKapp
//
//  Created by Оливер Салихов on 23.01.2022.
//

import UIKit

class AllFriendsCell: UITableViewCell {
    
    static func nib() -> UINib {
        return UINib(nibName: "AllFriendsCell", bundle: nil)
    }
    
    static let cellId = "FriendCell"
    
    
    // Стави приват, чтобы никто не смог их изменить
    @IBOutlet private var friendName: UILabel?
    @IBOutlet private var friendImage: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none

        // Configure the view for the selected state
    }
    
    func setData(with data: friendsLabel) {
        friendName?.text = data.name
        friendImage?.image = UIImage(named: data.photo)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        friendName?.text = nil
        friendImage?.image = nil 
    }

}
