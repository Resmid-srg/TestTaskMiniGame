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
                     backgroundColor: UIColor? = UIColor(named: "buttonColorNormal"),
                     font: UIFont? = .avenir20(),
                     cornerRadius: CGFloat = 16,
                     isEnabled: Bool = true,
                     alpha: CGFloat = 1) {
        self.init()
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        self.isEnabled = isEnabled
        self.alpha = alpha
    }
}
