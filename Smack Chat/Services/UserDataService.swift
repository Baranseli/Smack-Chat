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
    
    
    func returnUIColour(components: String) -> UIColor {
        
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        
        let defaultColour = UIColor.lightGray
        
        guard let rUnwrapped = r else { return defaultColour }
        guard let gUnwrapped = g else { return defaultColour }
        guard let bUnwrapped = b else { return defaultColour }
        guard let aUnwrapped = a else { return defaultColour }
        
        
        let rfloat = CGFloat(rUnwrapped.doubleValue)
        let gfloat = CGFloat(gUnwrapped.doubleValue)
        let bfloat = CGFloat(bUnwrapped.doubleValue)
        let afloat = CGFloat(aUnwrapped.doubleValue)
        
        let newUIColour = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        
        return newUIColour
        
        
        
    }
    
    
    func logoutUser() {
        id = ""
        avatarName = ""
        avatarColour = ""
        email = ""
        name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
    }
    
    
    
    
    
    
}
