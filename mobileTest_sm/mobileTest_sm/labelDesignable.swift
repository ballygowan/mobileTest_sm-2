//
//  labelDesignable.swift
//  mobileTest_sm
//
//  Created by Shane McCully on 27/05/2018.
//  Copyright © 2018 Shane McCully. All rights reserved.
//

import UIKit

@IBDesignable
class labelDesignable: UILabel {

    @IBInspectable var cornerRadius: CGFloat = 0{ 
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
}
