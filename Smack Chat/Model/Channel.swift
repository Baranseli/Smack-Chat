//
//  Channel.swift
//  Smack Chat
//
//  Created by Kafkas Baranseli on 13/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import Foundation

struct Channel : Decodable {
    public private(set) var channelTitle : String!
    public private(set) var channelDescription : String!
    public private(set) var _id : String! 
}
