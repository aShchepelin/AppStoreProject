//
//  OnboardingViewController.swift
//  AppStoreHW
//
//  Created by Александр Андреевич Щепелин on 12.10.2022.
//

import UIKit

/// Экран онбординга
final class OnboardingViewController: UIViewController {
    
    // MARK: - Vusial elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.frame = CGRect(x: 0, y: 150, width: 400, height: 400)
        return imageView
    }()
    
    private let titleLabel: UILabel = {
       let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .boldSystemFont(ofSize: 25)
        title.textColor = .black
        title.textAlignment = .center
        title.frame = CGRect(x: 0, y: 560, width: 300, height: 50)
        return title
    }()
    
    private let subtitleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 20)
        title.textColor = .black
        title.textAlignment = .center
        title.numberOfLines = 2
        title.frame = CGRect(x: 0, y: 620, width: 400, height: 50)
        return title
    }()
    
    // MARK: - Initialisators
    
    init(imageName: String, titleText: String, subtitleText: String) {
          super.init(nibName: nil, bundle: nil)
          imageView.image = UIImage(named: imageName)
          titleLabel.text = titleText
          subtitleLabel.text = subtitleText
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       setupViewWillAppear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        setupViewDidDisappear()
    }
    
    // MARK: - Private methods
    
    private func setupViewWillAppear() {
        UILabel.animate(withDuration: 2) {
            self.titleLabel.alpha = 1
            self.subtitleLabel.alpha = 1
        }
    }
    
    private func setupViewDidDisappear() {
        titleLabel.alpha = 0
        subtitleLabel.alpha = 0
    }
    
    private func setupUI() {
        titleLabel.center.x = view.center.x
        subtitleLabel.center.x = view.center.x
        view.backgroundColor = .white
        view.addSubview(subtitleLabel)
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        titleLabel.alpha = 0
        subtitleLabel.alpha = 0
    }
    
}
