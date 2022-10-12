//
//  ClientViewController.swift
//  AppStoreHW
//
//  Created by Александр Андреевич Щепелин on 06.10.2022.
//

import UIKit

/// Экран с рекомендациями
final class ClientViewController: UIViewController {
    
    // MARK: - Enum
    
    private enum Constants {
        static let whatNews = "Вот что нового"
        static let orderStatus = "Ваш заказ отправлен."
        static let productQuantity = "1 товар, доставка завтра"
        static let processedBy = "Обрабатывается"
        static let sent = "Отправлено"
        static let delivered = "Доставлено"
        static let recomended = "Рекомендуется вам"
        static let news = "Получайте новости о своем заказе в режиме реального времени."
        static let notification = "Включите уведомления, чтобы получать новости о своем заказе."
        static let devices = "ваши устройства"
        static let showAll = "Показать все"
        static let title = "Для вас"
        static let ImageSizeForLargeState: CGFloat = 40
        static let ImageRightMargin: CGFloat = 16
        static let ImageBottomMarginForLargeState: CGFloat = 12
        static let ImageBottomMarginForSmallState: CGFloat = 6
        static let ImageSizeForSmallState: CGFloat = 32
        static let NavBarHeightSmallState: CGFloat = 44
        static let NavBarHeightLargeState: CGFloat = 96.5
        static let grayCustomColorName = "lightGrayCustomColor"
    }
    
    // MARK: - Visual elements
    
    private let clientScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 120, width: 400, height: 900)
        scrollView.showsHorizontalScrollIndicator = true
        return scrollView
    }()
    
    private let whatNews: UILabel = {
        let whatNews = UILabel()
        whatNews.font = .systemFont(ofSize: 30, weight: .semibold)
        whatNews.textColor = .label
        whatNews.text = Constants.whatNews
        whatNews.frame = CGRect(x: 15, y: 20, width: 250, height: 40)
        return whatNews
    }()
    
    private let orderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.frame = CGRect(x: 15, y: 80, width: 360, height: 170)
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 10
        return view
    }()
    
    private let myOrderLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.orderStatus
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .label
        label.frame = CGRect(x: 85, y: 20, width: 200, height: 20)
        return label
    }()
    
    private let productOrderQuantityLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.productQuantity
        label.textColor = .gray
        label.frame = CGRect(x: 85, y: 50, width: 200, height: 20)
        return label
    }()
    
    private let proccessLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.processedBy
        label.font = .systemFont(ofSize: 13)
        label.frame = CGRect(x: 5, y: 130, width: 120, height: 30)
        return label
    }()
    
    private let sentLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.sent
        label.font = .systemFont(ofSize: 13)
        label.frame = CGRect(x: 140, y: 130, width: 120, height: 30)
        return label
    }()
    
    private let deliveredLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.delivered
        label.font = .systemFont(ofSize: 13)
        label.textColor = .lightGray
        label.frame = CGRect(x: 260, y: 130, width: 120, height: 30)
        return label
    }()
    
    private let orderButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: Images.chevronImageName), for: .normal)
        button.frame = CGRect(x: 330, y: 54, width: 15, height: 20)
        button.tintColor = .gray
        return button
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 100, width: 360, height: 1)
        view.backgroundColor = UIColor(named: Constants.grayCustomColorName)
        return view
    }()
    
    private let titleLineView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 15, y: 0, width: 360, height: 1)
        view.backgroundColor = UIColor(named: Constants.grayCustomColorName)
        return view
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 10, y: 20, width: 70, height: 70)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: Images.airPodsImageName)
        return imageView
    }()
    
    private let recomendLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.recomended
        label.font = .boldSystemFont(ofSize: 25)
        label.frame = CGRect(x: 15, y: 330, width: 300, height: 30)
        return label
    }()
    
    private let badgeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: Images.budgeImageName), for: .normal)
        button.frame = CGRect(x: 30, y: 400, width: 50, height: 50)
        button.tintColor = .systemRed
        return button
    }()
    
    private let newsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.news
        label.numberOfLines = 3
        label.font = .boldSystemFont(ofSize: 15)
        label.frame = CGRect(x: 90, y: 400, width: 250, height: 70)
        return label
    }()
    
    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.notification
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.frame = CGRect(x: 90, y: 460, width: 290, height: 50)
        return label
    }()
    
    private let newsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: Images.chevronImageName), for: .normal)
        button.frame = CGRect(x: 350, y: 440, width: 15, height: 20)
        button.tintColor = .gray
        return button
    }()
    
    private let recomendSeparatorView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 15, y: 540, width: 360, height: 1)
        view.backgroundColor = UIColor(named: Constants.grayCustomColorName)
        return view
    }()
    
    private let devicesLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.devices
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.frame = CGRect(x: 10, y: 570, width: 300, height: 30)
        label.textColor = .label
        return label
    }()
    
    private let showAllLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.showAll
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemBlue
        label.frame = CGRect(x: 280, y: 563, width: 120, height: 50)
        return label
    }()
    
    // MARK: - Private properties
    private var orderProgressView = UIProgressView()
    private let avatarImageView = UIImageView(image: UIImage(systemName: Images.clientImageName))
    
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        overrideUserInterfaceStyle = .light
        tabBarController?.overrideUserInterfaceStyle = .light
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        overrideUserInterfaceStyle = .light
        createScroolView()
        clientScrollView.addSubview(whatNews)
        clientScrollView.addSubview(orderView)
        orderView.addSubview(productImageView)
        orderView.addSubview(myOrderLabel)
        orderView.addSubview(productOrderQuantityLabel)
        orderView.addSubview(orderButton)
        orderView.addSubview(proccessLabel)
        orderView.addSubview(sentLabel)
        orderView.addSubview(deliveredLabel)
        orderView.addSubview(separatorView)
        clientScrollView.addSubview(recomendLabel)
        clientScrollView.addSubview(badgeButton)
        clientScrollView.addSubview(newsLabel)
        clientScrollView.addSubview(notificationLabel)
        clientScrollView.addSubview(titleLineView)
        clientScrollView.addSubview(newsButton)
        clientScrollView.addSubview(recomendSeparatorView)
        clientScrollView.addSubview(devicesLabel)
        clientScrollView.addSubview(showAllLabel)
        orderProgressView(orderProgressView)
        avatarButtonItem()
        avatarImageView.tintColor = .gray
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                               action: #selector(
                                                                 presentImagePickerController)))
        avatarImageView.image = checkAvatar()
    }
    
    @objc private func presentImagePickerController() {
        let imagePickerView = UIImagePickerController()
        imagePickerView.delegate = self
        imagePickerView.allowsEditing = true
        present(imagePickerView, animated: true)
    }
    
    private func createScroolView() {
        let scrollViewRect = CGRect(x: 0, y: 240, width: view.bounds.width, height: view.bounds.height + 300)
        clientScrollView.contentSize = CGSize(width: scrollViewRect.size.width,
                                              height: scrollViewRect.size.height)
        clientScrollView.contentMode = .scaleAspectFit
        view.addSubview(clientScrollView)
    }
    
    private func orderProgressView(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: 5, y: 125, width: 335, height: 15)
        progressView.setProgress(0.5, animated: true)
        progressView.progressTintColor = .systemGreen
        progressView.trackTintColor = UIColor(named: Constants.grayCustomColorName)
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 3)
        progressView.layer.cornerRadius = 5
        progressView.clipsToBounds = true
        orderView.addSubview(progressView)
    }
    
    private func avatarButtonItem() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = Constants.title
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(avatarImageView)
        avatarImageView.layer.cornerRadius = Constants.ImageSizeForLargeState / 2
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor,
                                              constant: -Constants.ImageRightMargin),
            avatarImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,
                                               constant: -Constants.ImageBottomMarginForLargeState),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.ImageSizeForLargeState),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor)
        ])
    }
    
    private func saveToUserDefaults(image: Data) {
        let defaults = UserDefaults.standard
        defaults.set(image, forKey: "Avatar")
    }
    
    private func checkAvatar() -> UIImage? {
        let userDefaults = UserDefaults.standard
        guard let dataImage = userDefaults.object(forKey: "Avatar") as? Data,
              let image = UIImage(data: dataImage) else {
            let image = UIImage(systemName: Images.clientImageName)?.resizeImage(to: CGSize(width: 30, height: 30))
            return image
        }
        return image
    }
    
    private func moveAndResizeImage(for height: CGFloat) {
        let coeff: CGFloat = {
            let delta = height - Constants.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (Constants.NavBarHeightLargeState - Constants.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()
        
        let factor = Constants.ImageSizeForSmallState / Constants.ImageSizeForLargeState
        
        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()
        
        let sizeDiff = Constants.ImageSizeForLargeState * (1.0 - factor)
        
        let yTranslation: CGFloat = {
          
            let maxYTranslation = Constants.ImageBottomMarginForLargeState -
            Constants.ImageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation, (maxYTranslation -
                                                coeff * (Constants.ImageBottomMarginForSmallState + sizeDiff))))
        }()
        
        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)
        
        avatarImageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
    
}
/// UIScrollViewDelegate
extension ClientViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        moveAndResizeImage(for: height)
    }
}
/// UIImagePickerControllerDelegate
extension ClientViewController: UIImagePickerControllerDelegate {
     func imagePickerController(
        _ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            
            guard let image = info[.editedImage] as? UIImage else { return }
            let img = image.resizeImage(to: CGSize(width: 30, height: 30))
            avatarImageView.image = img
            guard let imageData = image.pngData() else { return }
            saveToUserDefaults(image: imageData)
            self.dismiss(animated: true)
    }
}
/// UINavigationControllerDelegate
extension ClientViewController: UINavigationControllerDelegate {
    
}
