//
//  ProfileVC.swift
//  Smack Chat
//
//  Created by Kafkas Baranseli on 13/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
       
    }

    @IBAction func closeModuleBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutBtnClicked(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    

    func setupView() {
        username.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        profileImage.backgroundColor = UserDataService.instance.returnUIColour(components: UserDataService.instance.avatarColour)
        
        
        let clouseTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_recognizer:)))
        
        bgView.addGestureRecognizer(clouseTouch)
    }
    
    
    @objc func closeTap(_recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
