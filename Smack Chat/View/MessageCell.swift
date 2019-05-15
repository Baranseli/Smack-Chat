//
//  MessageCell.swift
//  Smack Chat
//
//  Created by Kafkas Baranseli on 15/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var userimg: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func configureCell(message: Message) {
        messageBodyLbl.text = message.message
        userNameLbl.text = message.userName
        userimg.image = UIImage(named: message.userAvatar)
        userimg.backgroundColor = UserDataService.instance.returnUIColour(components: message.userAvatarColour)
        
    }
    

}
