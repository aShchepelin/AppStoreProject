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
        static let searchLabelText = "Поиск"
    }
    // MARK: - Private properties
    private let shopViewController = ShopViewController()
    private let shopTabBarItem = UITabBarItem(title: Constants.shopItemText,
                                              image: UIImage(systemName: Images.buyImageName),
                                              tag: 0)
    
    private let clientViewController = ClientViewController()
    private let clientTabBarItem = UITabBarItem(title: Constants.clientItemText,
                                                image: UIImage(systemName: Images.clientImageName),
                                                tag: 1)
    
    private let searchViewController = SearchViewController()
    private let searchTabBarItem = UITabBarItem(title: Constants.searchItemText,
                                                image: UIImage(systemName: Images.glassImageName),
                                                tag: 2)
    
    private let basketViewController = BasketViewController()
    private let basketTabBarItem = UITabBarItem(title: Constants.basketItemText,
                                                image: UIImage(systemName: Images.basketImageName),
                                                tag: 3)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Private methods
    
    private func setupUI() {
        let navigationController = UINavigationController(rootViewController: searchViewController)
        viewControllers = [shopViewController, clientViewController, navigationController, basketViewController]
        shopViewController.tabBarItem = shopTabBarItem
        clientViewController.tabBarItem = clientTabBarItem
        searchViewController.tabBarItem = searchTabBarItem
        basketViewController.tabBarItem = basketTabBarItem
        tabBar.backgroundColor = .secondarySystemBackground
    }
}
