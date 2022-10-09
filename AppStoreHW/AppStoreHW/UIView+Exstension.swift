//
//  UIView+Exstension.swift
//  AppStoreHW
//
//  Created by Александр Андреевич Щепелин on 06.10.2022.
//

import UIKit

/// Расширение UIControl для создания линии
extension UIView {
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.secondarySystemBackground.cgColor
        border.frame = CGRect(
            x: 0, y: self.frame.size.height - width,
            width: self.frame.size.width - 10,
            height: self.frame.size.height
        )
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}