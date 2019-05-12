//
//  GradientView.swift
//  Smack Chat
//
//  Created by Kafkas Baranseli on 11/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit

// to make gradient
@IBDesignable
class GradientView: UIView {

    @IBInspectable var topColour: UIColor = UIColor.blue {
        didSet {
            self.setNeedsLayout()
        }
    }
   
    @IBInspectable var bottomColour: UIColor = UIColor.cyan {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColour.cgColor, bottomColour.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    
    
    
    

}
