//
//  RoundedButton.swift
//  Smack Chat
//
//  Created by Kafkas Baranseli on 12/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius : CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
   
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }

}
