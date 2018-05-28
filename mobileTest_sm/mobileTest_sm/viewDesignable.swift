//
//  viewDesignable.swift
//  mobileTest_sm
//
//  Created by Shane McCully on 28/05/2018.
//  Copyright © 2018 Shane McCully. All rights reserved.
//

import UIKit

@IBDesignable // interface builder attribute exstensions 
class viewDesignable: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
            
        }
    }
    
}
