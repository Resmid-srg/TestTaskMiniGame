//
//  UILabel + Extension.swift
//  TestTaskMiniGame
//
//  Created by Serov Dmitry on 24.01.23.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont? = .avenir20()) {
        self.init()
        
        self.text = text
        self.font = font
    }
}
