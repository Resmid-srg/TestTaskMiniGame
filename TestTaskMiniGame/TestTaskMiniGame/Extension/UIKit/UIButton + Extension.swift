//
//  UIButton + Extension.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 24.01.23.
//

import UIKit

extension UIButton {
    
    convenience init(title: String,
                     titleColor: UIColor? = .white,
                     backgroundColor: UIColor? = .blue,
                     font: UIFont? = .avenir20(),
                     cornerRadius: CGFloat = 4) {
        self.init()
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
    }
}
