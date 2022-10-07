//
//  ProductViewController.swift
//  AppStoreHW
//
//  Created by Александр Андреевич Щепелин on 06.10.2022.
//

import UIKit

/// Экран с выбранным товаром
final class ProductViewController: UIViewController {
    
    // MARK: - Visual Components
    
    private let productInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 2
        label.frame = CGRect(x: 10, y: 100, width: 400, height: 50)
        return label
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 20, y: 200, width: 350, height: 200)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Public properties
    var productInfo = ""
    var productImage = ""
  
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
  
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
        productInfoLabel.text = productInfo
        view.addSubview(productInfoLabel)
        view.addSubview(productImageView)
        productImageView.image = UIImage(named: productImage)
    }
}
