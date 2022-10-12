//
//  UIImage+Exstension.swift
//  AppStoreHW
//
//  Created by Александр Андреевич Щепелин on 12.10.2022.
//

import UIKit

/// Расширение для добавления метода resizeImage
extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
