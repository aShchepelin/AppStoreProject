//
//  SearchViewController.swift
//  AppStoreHW
//
//  Created by Александр Андреевич Щепелин on 06.10.2022.
//

import UIKit

/// Экран с поиском и выбором товаров
final class SearchViewController: UIViewController {
    
    // MARK: - Enum
    private enum Constants {
        static let searchLabelText = "Поиск"
        static let searchTextFieldPlaceholderText = "Поиск по продуктам и магазинам"
        static let recentlyViewedLabelText = "Недавно просмотренные"
        static let cleanButtonTitleText = "Очистить"
        static let requestOptionsLabelText = "Варианты запросов"
        static let blackCaseLabelText = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let watchbandLabelText = "Спортивный ремешок Black Unity"
        static let brownCaseLabelText = "Кожаный чехол для MacBook Pro 16 дюймов, коричневый"
        static let iPhoneCaseLabelText = "Iphone 12 pro какого-то цвета"
        static let airPodsLabelText = "AirPods"
        static let appleCareLabelText = "AppleCare"
        static let beatsLabelText = "Beats"
        static let iphoneLabelText = "Сравнение модели iPhone"
        static let blackCaseCost = "3 990.00 руб"
        static let brownCaseCost = "4 990.00 руб"
        static let watchbandCost = "1 200.00 руб"
        static let iPhoneCost = "89 900.00 руб"
    }
    // MARK: - Visual Components
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = Constants.searchTextFieldPlaceholderText
        searchBar.frame = CGRect(x: 10, y: 150, width: 380, height: 30)
        return searchBar
    }()
    
    private let recentlyViewedLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.recentlyViewedLabelText
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 20)
        label.frame = CGRect(x: 20, y: 200, width: 300, height: 50)
        return label
    }()
    
    private let cleanButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.cleanButtonTitleText, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.frame = CGRect(x: 280, y: 211, width: 90, height: 30)
        return button
    }()
    
    private let blackCaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.frame = CGRect(x: 20, y: 0, width: 150, height: 200)
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let blackCaseLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.blackCaseLabelText
        label.numberOfLines = 3
        label.font = .boldSystemFont(ofSize: 13)
        label.frame = CGRect(x: 13, y: 120, width: 130, height: 80)
        return label
    }()
    
    private let brownCaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.frame = CGRect(x: 360, y: 0, width: 150, height: 200)
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let brownCaseLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.brownCaseLabelText
        label.numberOfLines = 3
        label.font = .boldSystemFont(ofSize: 13)
        label.frame = CGRect(x: 13, y: 120, width: 130, height: 80)
        return label
    }()
    
    private let watchbandView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.frame = CGRect(x: 190, y: 0, width: 150, height: 200)
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let iPhoneCaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.frame = CGRect(x: 530, y: 0, width: 150, height: 200)
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let iPhoneCaseLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.iPhoneCaseLabelText
        label.numberOfLines = 3
        label.font = .boldSystemFont(ofSize: 13)
        label.frame = CGRect(x: 13, y: 120, width: 130, height: 80)
        return label
    }()
    
    private let watchbandLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.watchbandLabelText
        label.numberOfLines = 3
        label.font = .boldSystemFont(ofSize: 13)
        label.frame = CGRect(x: 13, y: 120, width: 130, height: 80)
        return label
    }()
    
    private let requestOptionsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.requestOptionsLabelText
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 20, y: 470, width: 300, height: 50)
        return label
    }()
    
    private let airPodsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.airPodsLabelText
        label.textColor = .label
        label.font = .systemFont(ofSize: 20)
        label.frame = CGRect(x: 50, y: 10, width: 300, height: 50)
        return label
    }()
    
    private let glassForAirPodsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: GeneralConstants.glassImageName), for: .normal)
        button.tintColor = .gray
        button.contentMode = .scaleAspectFit
        button.frame = CGRect(x: 20, y: 25, width: 20, height: 20)
        return button
    }()
    
    private let appleCareLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.appleCareLabelText
        label.textColor = .label
        label.font = .systemFont(ofSize: 20)
        label.frame = CGRect(x: 50, y: 10, width: 300, height: 50)
        return label
    }()
    
    private let glassForAppleCareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: GeneralConstants.glassImageName), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 20, y: 25, width: 20, height: 20)
        return button
    }()
    
    private let beatsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.beatsLabelText
        label.textColor = .label
        label.font = .systemFont(ofSize: 20)
        label.frame = CGRect(x: 50, y: 10, width: 300, height: 50)
        return label
    }()
    
    private let glassBeatsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: GeneralConstants.glassImageName), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 20, y: 25, width: 20, height: 20)
        return button
    }()
    
    private let iPhoneLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.iphoneLabelText
        label.textColor = .label
        label.font = .systemFont(ofSize: 20)
        label.frame = CGRect(x: 50, y: 10, width: 300, height: 50)
        return label
    }()
    
    private let glassIPhoneButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: GeneralConstants.glassImageName), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 20, y: 25, width: 20, height: 20)
        return button
    }()
    
    private let airPodsSearchView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.frame = CGRect(x: 20, y: 520, width: 350, height: 50)
        return view
    }()
    
    private let appleCareSearchView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.frame = CGRect(x: 20, y: 570, width: 350, height: 50)
        return view
    }()
    
    private let beatsSearchView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.frame = CGRect(x: 20, y: 620, width: 350, height: 50)
        return view
    }()
    
    private let iPhoneSearchView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.frame = CGRect(x: 20, y: 670, width: 350, height: 50)
        return view
    }()
    
    private lazy var productScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.frame = CGRect(x: 0, y: 250, width: self.view.bounds.width, height: 210)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 210)
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    // MARK: - Private properties
    private var viewFrame = 13
    private var tag = 0
    
    // MARK: - Public properties
    var products = [Product(name: "Чехол Incase Flat для MacBook Pro 16 дюймов",
                          imageNames: ["caseBlack", "caseBlack2", "caseBlack3"],
                          cost: "3 990.00 руб",
                           link: "https://re-store.ru/catalog/INMB100649-BLK/"),
                   Product(name: "Кожаный чехол для MacBook Pro 16 дюймов, коричневый",
                           imageNames: ["caseBrown", "caseBrown2", "caseBrown3"],
                           cost: "4 990.00 руб",
                           link: "https://re-store.ru/catalog/PA15SASA5450/"),
                   Product(name: "Спортивный ремешок Black Unity",
                           imageNames: ["4", "clock2", "clock3"],
                           cost: "1 200.00 руб",
                           link: "https://re-store.ru/catalog/MJ4W3ZM-A/"),
                   Product(name: "Iphone 12 pro какого-то цвета",
                           imageNames: ["iphone", "iphone2", "iphone3"],
                           cost: "89 900.00 руб",
                           link: "https://re-store.ru/catalog/MGED3RU-A/") ]
    
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
    // MARK: - Private methods
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        searchBar.searchBarStyle = .minimal
        view.addSubview(searchBar)
        view.addSubview(recentlyViewedLabel)
        view.addSubview(cleanButton)
        view.addSubview(requestOptionsLabel)
        view.addSubview(airPodsSearchView)
        view.addSubview(appleCareSearchView)
        view.addSubview(beatsSearchView)
        view.addSubview(iPhoneSearchView)
        view.addSubview(productScrollView)
        createAirPodsSearchView()
        createAppleCareSearchView()
        createBeatsSearchView()
        createIphoneSearchView()
        createScroolView()
        addView()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = Constants.searchLabelText
    }
    
    private func createScroolView() {
        let scrollViewRect = CGRect(x: 0, y: 240, width: view.bounds.width + 300, height: 210)
        productScrollView.contentSize = CGSize(width: scrollViewRect.size.width,
                                               height: 200)
        productScrollView.contentMode = .scaleAspectFit
        view.addSubview(productScrollView)
    }
    
    private func addView() {
        for item in products {
            createProductView(image: item.imageNames.first ?? "", info: item.name, cost: item.cost, tag: tag)
            tag += 1
        }
    }
    
    private func createProductView(image: String, info: String, cost: String, tag: Int) {
        let productView = UIView()
        productView.backgroundColor = .secondarySystemBackground
        productView.frame = CGRect(x: viewFrame, y: 0, width: 150, height: 200)
        productView.layer.cornerRadius = 15
        
        let label = UILabel()
        label.text = info
        label.textColor = .label
        label.numberOfLines = 3
        label.font = .boldSystemFont(ofSize: 13)
        label.frame = CGRect(x: 13, y: 120, width: 130, height: 80)
        
        let productImageView = UIImageView()
        let productImage = UIImage(named: image)
        productImageView.contentMode = .scaleAspectFit
        productImageView.image = productImage
        productImageView.frame = CGRect(x: 23, y: 30, width: 100, height: 100)
        
        productView.addSubview(productImageView)
        productView.addSubview(label)
        productView.tag = tag
        productView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        viewFrame += 177
        productScrollView.addSubview(productView)
    }
   
    private func createAirPodsSearchView() {
        airPodsSearchView.addSubview(airPodsLabel)
        airPodsSearchView.addSubview(glassForAirPodsButton)
        airPodsSearchView.setUnderLine()
    }
    
    private func createAppleCareSearchView() {
        appleCareSearchView.addSubview(appleCareLabel)
        appleCareSearchView.addSubview(glassForAppleCareButton)
        appleCareSearchView.setUnderLine()
    }
    
    private func createBeatsSearchView() {
        beatsSearchView.addSubview(beatsLabel)
        beatsSearchView.addSubview(glassBeatsButton)
        beatsSearchView.setUnderLine()
    }
    
    private func createIphoneSearchView() {
        iPhoneSearchView.addSubview(iPhoneLabel)
        iPhoneSearchView.addSubview(glassIPhoneButton)
        iPhoneSearchView.setUnderLine()
    }
    
    @objc private func handleTap(param: UIGestureRecognizer) {
        let productViewController = ProductViewController()
        guard let tag = param.view?.tag else { return }
        productViewController.product = products[tag]
        
        navigationController?.pushViewController(productViewController, animated: true)
    }
}
