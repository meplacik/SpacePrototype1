//
//  SpaceTableViewCell.swift
//  SpacePrototype1
//
//  Created by Madeline Placik on 4/14/19.
//  Copyright © 2019 Madeline Placik. All rights reserved.
//

import UIKit

class SpaceTableViewCell: UITableViewCell {

    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cafeDescription: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.layer.cornerRadius = 5
        photoImageView.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
