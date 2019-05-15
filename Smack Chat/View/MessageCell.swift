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
        
        guard var isoDate = message.timeStamp else { return }
        var end = isoDate.index(isoDate.endIndex, offSetBy: -5)
        isoDate = isoDate.substring(to: end)
        
        let isoFormatter = ISO8601DateFormatter()
        let chatDate = isoFormatter.date(from: isoDate.appending("Z"))
        
        let newFormatter = DateFormatter()
        newFormatter.dateFormat = "MMM d, h:mm a"
        
        if let finalDate = chatDate {
            let finalDate = newFormatter.string(from: finalDate)
            timeStamp.text = finalDate
        }
    }
    
}
