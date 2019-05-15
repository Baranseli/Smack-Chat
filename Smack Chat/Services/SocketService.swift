//
//  SocketService.swift
//  Smack Chat
//
//  Created by Kafkas Baranseli on 14/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit
import SocketIO


// to use sockets import SocketIO, then as all services create a static let instance under name of class.
class SocketService: NSObject {
    
    static let instance = SocketService()
    
    // all sockets must have init hit enter then super.init()
    override init() {
        super.init()
    }
    
    // to create web sockets initiate URL socket as shown. String is your API URL address
    var socket : SocketIOClient = SocketIOClient(socketURL: URL(string: BASE_URL)!)
    
    
    
    // to connect
    func establishConnetion() {
        socket.connect()
    }
   
    // to disconnect
    func closeConnection() {
        socket.disconnect()
    }
    
    // then go to AppDelegate, func applicationDidBecomeActive for socket.connect(), and func applicationWillTerminate for socket.disconnect
    

    
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDescription = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDescription, _id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    
    
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler) {
        let user = UserDataService.instance
        socket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColour)
        completion(true)
    }
    
    
    func getChatMessages(completion: @escaping CompletionHandler) {
        socket.on("messaceCreated") { (dataArray, ack) in
            guard let msgBody = dataArray[0] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
             guard let userName = dataArray[3] as? String else { return }
             guard let userAvatar = dataArray[4] as? String else { return }
             guard let userAvatarColour = dataArray[5] as? String else { return }
             guard let id = dataArray[6] as? String else { return }
             guard let timeStamp = dataArray[7] as? String else { return }
            
            if channelId == MessageService.instance.selectedChannel?.id && AuthService.instance.isLoggedIn {
                let newMessage = Message(message: msgBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColour: userAvatarColour, id: id, timeStamp: timeStamp)
                MessageService.instance.messages.append(newMessage)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    
    
    
}
