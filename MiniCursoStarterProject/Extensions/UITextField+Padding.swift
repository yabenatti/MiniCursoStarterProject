//
//  UITextField+Padding.swift
//  MiniCursoParte1
//
//  Created by Yasmin Benatti on 2017-11-05.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit

//Extension used to add a padding to the right or left view of the text field
extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
