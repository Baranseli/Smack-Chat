//
//  Constants.swift
//  Smack Chat
//
//  Created by Kafkas Baranseli on 11/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// url Constants
let BASE_URL = "https://chattychatjb.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail"
let URL_GET_CHANNELS = "\(BASE_URL)channel"



// Colours
let smackPurplePlaceHolder = #colorLiteral(red: 0.3266413212, green: 0.4215201139, blue: 0.7752227187, alpha: 0.5)

// Notification Constants
let NOTIF_USER_DATA_CHANGE = Notification.Name("notifUserDataChanged")

// segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

// user defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Authorization" : "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]
