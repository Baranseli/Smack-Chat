//
//  CreateAccountVC.swift
//  Smack Chat
//
//  Created by Kafkas Baranseli on 11/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    var avatarName = "profileDefault"
    var avatarColour = "[0.5, 0.5, 0.5, 1]"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
    }
  
    
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }
    
    @IBAction func createAccountBtnClicked(_ sender: Any) {
        guard let name = usernameTxtFld.text , usernameTxtFld.text != "" else { return }
        guard let email = emailTxtFld.text , emailTxtFld.text != "" else { return }
        guard let pass = passwordTxtFld.text , passwordTxtFld.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColour: self.avatarColour, completion: { (success) in
                            if success {
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
            }
            
        }
    }
    
    
    @IBAction func pickAvatarBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBGColourBtnCLicked(_ sender: Any) {
    }
    
    
    
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    

   

}
