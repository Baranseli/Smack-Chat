//
//  ChannelVC.swift
//  Smack Chat
//
//  Created by Kafkas Baranseli on 11/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwined(segue: UIStoryboardSegue) {}
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_CHANGE, object: nil)
    
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
       setupUserInfo()
    }
    
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        
        if AuthService.instance.isLoggedIn {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    func setupUserInfo() {
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.returnUIColour(components: UserDataService.instance.avatarColour)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.backgroundColor = UIColor.clear
        }
    }


   

}
