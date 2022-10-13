//
//  ClintTabBarController.swift
//  AppStoreHW
//
//  Created by Александр Андреевич Щепелин on 06.10.2022.
//

import UIKit

/// Главный контроллер tabBar
final class MainTabBarController: UITabBarController {
    // MARK: - Enum
    private enum Constants {
        static let shopItemText = "Купить"
        static let clientItemText = "Для вас"
        static let searchItemText = "Поиск"
        static let basketItemText = "Корзина"
    }
    // MARK: - Private properties
    private let shopViewController = ShopViewController()
    private let shopTabBarItem = UITabBarItem(title: Constants.shopItemText,
                                              image: UIImage(systemName: GeneralConstants.buyImageName),
                                              tag: 0)
    
    private let clientViewController = ClientViewController()
    private let clientTabBarItem = UITabBarItem(title: Constants.clientItemText,
                                                image: UIImage(systemName: GeneralConstants.clientImageName),
                                                tag: 1)
    
    private let searchViewController = SearchViewController()
    private let searchTabBarItem = UITabBarItem(title: Constants.searchItemText,
                                                image: UIImage(systemName: GeneralConstants.glassImageName),
                                                tag: 2)
    
    private let basketViewController = BasketViewController()
    private let basketTabBarItem = UITabBarItem(title: Constants.basketItemText,
                                                image: UIImage(systemName: GeneralConstants.basketImageName),
                                                tag: 3)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Private methods
    
    private func setupUI() {
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)
        let clientNavigationController = UINavigationController(rootViewController: clientViewController)
        viewControllers = [shopViewController, clientNavigationController, searchNavigationController,
                           basketViewController]
        shopViewController.tabBarItem = shopTabBarItem
        clientNavigationController.tabBarItem = clientTabBarItem
        searchNavigationController.tabBarItem = searchTabBarItem
        basketViewController.tabBarItem = basketTabBarItem
        tabBar.backgroundColor = .secondarySystemBackground
    }
}
