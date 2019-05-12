//
//  UserDataService.swift
//  Smack Chat
//
//  Created by Kafkas Baranseli on 12/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColour = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, avatarColour: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColour = avatarColour
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName   
    }
    
    
}
