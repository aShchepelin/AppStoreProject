//
//  ClientViewController.swift
//  AppStoreHW
//
//  Created by Александр Андреевич Щепелин on 06.10.2022.
//

import UIKit

/// Экран с рекомендациями
final class ClientViewController: UIViewController {
    
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
   
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
}
