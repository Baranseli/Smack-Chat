//
//  ChatVC.swift
//  Smack Chat
//
//  Created by Kafkas Baranseli on 11/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().PanGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().TabGestureRecognizer())
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGE, object: nil)
            }
        }
        
      
        
    }
    
    
    
    

   

}
