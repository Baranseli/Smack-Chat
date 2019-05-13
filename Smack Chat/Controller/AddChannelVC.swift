//
//  AddChannelVC.swift
//  Smack Chat
//
//  Created by Kafkas Baranseli on 14/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var descriptionTxtFld: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
       
    }

    @IBAction func closeModalBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelBtnClicked(_ sender: Any) {
    }
    
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTab(_recognizer:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxtFld.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor : smackPurplePlaceHolder])
        
        descriptionTxtFld.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor : smackPurplePlaceHolder])
        
    }
    
    
    @objc func closeTab(_recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
