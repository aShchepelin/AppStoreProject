//
//  Collection+Exstension.swift
//  AppStoreHW
//
//  Created by Александр Андреевич Щепелин on 10.10.2022.
//

import Foundation
extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
