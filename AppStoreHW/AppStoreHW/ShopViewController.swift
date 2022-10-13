//
//  ShopViewController.swift
//  AppStoreHW
//
//  Created by Александр Андреевич Щепелин on 06.10.2022.
//

import UIKit

/// Экран магазина?
final class ShopViewController: UIViewController {
    
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        overrideUserInterfaceStyle = .dark
        tabBarController?.overrideUserInterfaceStyle = .dark
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        launchOnboarding()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func launchOnboarding() {
        
        if UserDefaults.standard.object(forKey: GeneralConstants.userDefaultsKey) == nil {
            let pageViewController = CyclePageViewController(transitionStyle: .scroll,
            navigationOrientation: .horizontal)
            
            pageViewController.modalPresentationStyle = .fullScreen
            present(pageViewController, animated: true)
        }
    }
    
}
