//
//  AvatarCell.swift
//  Smack Chat
//
//  Created by Kafkas Baranseli on 12/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit

enum AvatarType {
    case dark
    case light
}

class AvatarCell: UICollectionViewCell {
    
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    

    func configureCell(index: Int, type: AvatarType) {
        if type == AvatarType.dark{
            avatarImg.image = UIImage(named: "dark \(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            avatarImg.image = UIImage(named: "light \(index)")
            self.layer.backgroundColor = UIColor.darkGray.cgColor
        }
    }
    
    
    
    func setupView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    
    
    
    
}
