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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var avatarName = "profileDefault"
    var avatarColour = "[0.5, 0.5, 0.5, 1]"
    var bgColour : UIColor?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupView()
        
        
        
        
    }
  
    
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColour == nil {
                userImg.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    @IBAction func createAccountBtnClicked(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let name = usernameTxtFld.text , usernameTxtFld.text != "" else { return }
        guard let email = emailTxtFld.text , emailTxtFld.text != "" else { return }
        guard let pass = passwordTxtFld.text , passwordTxtFld.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColour: self.avatarColour, completion: { (success) in
                            if success {
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGE, object: nil)
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
       let r = CGFloat(arc4random_uniform(255)) / 255
       let g = CGFloat(arc4random_uniform(255)) / 255
       let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColour = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        avatarColour = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.2) {
            self.userImg.backgroundColor = self.bgColour
        }
        
    }
    
    
    
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
    func setupView()   {
        spinner.isHidden = true
        usernameTxtFld.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor : smackPurplePlaceHolder])
        emailTxtFld.attributedPlaceholder = NSAttributedString(string: "email address", attributes: [NSAttributedString.Key.foregroundColor : smackPurplePlaceHolder])
        passwordTxtFld.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor : smackPurplePlaceHolder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
   
    
    @objc func handleTap() {
        view.endEditing(true)
    }

}
