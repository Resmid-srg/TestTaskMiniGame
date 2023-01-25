//
//  UITextField + Extension.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 25.01.23.
//

import UIKit

extension UITextField {
    
    convenience init(textPlaceholder: String? = "",
                     borderStyle: UITextField.BorderStyle = .none ,
                     textAlignment: NSTextAlignment = .left) {
        self.init()
        
        self.placeholder = textPlaceholder
        self.borderStyle = borderStyle
        self.textAlignment = textAlignment
    }
}
