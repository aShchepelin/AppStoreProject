//
//  PageViewController.swift
//  AppStoreHW
//
//  Created by Александр Андреевич Щепелин on 12.10.2022.
//

import UIKit

/// Контроллер с перелистыванием и рабочими кнопками
final class CyclePageViewController: UIPageViewController {
    
    // MARK: - Enum
    
    private enum Constants {
        static let firstScreenTitleText = "Track Your Cycle"
        static let firstScreenSubtitleText = "Manage irregular period and learn how to improve your period"
        static let firstScreenImageName = "page1"
        static let secondScreenTitleText = "Plan Your Pregnancy"
        static let secondScreenSubtitleText =
        "Favorable days are important. Vestibulum rutrum quam vitae fringila tincidunt"
        static let secondScreenImageName = "page2"
        static let thirdScreenTitleText = "Daily Health Inside"
        static let thirdScreenSubtitleText = "Personal health inside. Vestibulum rutrum quam vitae fringila tincidunt"
        static let thirdScreenImageName = "page3"
        static let skipButtonText = "SKIP"
        static let nextButtonText = "NEXT"
        static let getStartedButtonText = "GET STARTED!"
        
    }
    
    // MARK: - Visual elements
    private lazy var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.skipButtonText, for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.frame = CGRect(x: 50, y: 780, width: 70, height: 20)
        button.addTarget(self, action: #selector(skipAction(_:)), for: .primaryActionTriggered)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.nextButtonText, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.frame = CGRect(x: 275, y: 780, width: 70, height: 20)
        button.addTarget(self, action: #selector(nextAction(_:)), for: .primaryActionTriggered)
        return button
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.getStartedButtonText, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.frame = CGRect(x: 0, y: 780, width: 150, height: 20)
        button.isHidden = true
        button.addTarget(self, action: #selector(getStartedAction(_:)), for: .primaryActionTriggered)
        return button
    }()
    
    private lazy var pageControl: UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.frame = CGRect(x: 0, y: 780, width: 200, height: 20)
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        return pageControl
    }()
   
    // MARK: - Private properties
    private var pages: [UIViewController] = []
    private var initialPage = 0
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPageControl()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        skipButton.alpha = 1
        nextButton.alpha = 1
        pageControl.alpha = 1
        dataSource = self
        delegate = self
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        view.addSubview(skipButton)
        view.addSubview(getStartedButton)
        let firstPage = OnboardingViewController(
            imageName: Constants.firstScreenImageName,
            titleText: Constants.secondScreenTitleText,
            subtitleText: Constants.firstScreenSubtitleText
        )
        
        let secondPage = OnboardingViewController(
            imageName: Constants.secondScreenImageName,
            titleText: Constants.secondScreenTitleText,
            subtitleText: Constants.secondScreenSubtitleText
        )
        let thirdPage = OnboardingViewController(
            imageName: Constants.thirdScreenImageName,
            titleText: Constants.thirdScreenTitleText,
            subtitleText: Constants.thirdScreenSubtitleText
        )
        pages.append(firstPage)
        pages.append(secondPage)
        pages.append(thirdPage)
        setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
        pageControl.center.x = view.center.x
        getStartedButton.center.x = view.center.x
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
    }
    
    private func hiddenButtons() {
        guard pageControl.currentPage == 2 else { return }
            nextButton.isHidden = true
            skipButton.isHidden = true
            pageControl.isHidden = true
            getStartedButton.isHidden = false
            UIView.transition(with: nextButton,
                              duration: 2, options: .transitionCrossDissolve,
                              animations: { self.nextButton.isHidden = true })
            UIView.transition(with: skipButton,
                              duration: 2, options: .transitionCrossDissolve,
                              animations: { self.skipButton.isHidden = true })
            UIView.transition(with: pageControl,
                              duration: 2, options: .transitionCrossDissolve,
                              animations: { self.pageControl.isHidden = true })
            UIView.transition(with: getStartedButton,
                              duration: 2, options: .transitionCrossDissolve,
                              animations: { self.getStartedButton.isHidden = false })
        
    }
    
    @objc private func goToNextPageAction(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
            guard let currentPage = viewControllers?[0] else { return }
            guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
            
            setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
        hiddenButtons()
        }
        
    @objc private func goToPreviousPageAction(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
            guard let currentPage = viewControllers?[0] else { return }
            guard let previousPage = dataSource?.pageViewController(self,
                                                                    viewControllerBefore: currentPage) else { return }
            
        setViewControllers([previousPage], direction: .forward, animated: animated, completion: completion)
        }
    
    @objc private func skipAction(_ sender: UIButton) {
        let lastPageIndex = pages.count - 1
        pageControl.currentPage = lastPageIndex
        goToLastPage(index: lastPageIndex, ofViewControllers: pages)
    }
        
    @objc private func nextAction(_ sender: UIButton) {
        if pageControl.currentPage < 2 { pageControl.currentPage += 1
            goToNextPageAction()
        }
    }
    
    @objc private func getStartedAction(_ sender: UIButton) {
        let firstLaunchUserDefaults = UserDefaults.standard
            firstLaunchUserDefaults.set(true, forKey: GeneralConstants.userDefaultsKey)
            dismiss(animated: true )
    }
    
    private func goToLastPage(index: Int, ofViewControllers pages: [UIViewController]) {
        setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
    }
}

/// UIPageViewControllerDelegate, UIPageViewControllerDataSource
extension CyclePageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last
        } else {
            showButtons()
            return pages[currentIndex - 1]
        }
    }
    
     func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func showButtons() {
        guard pageControl.currentPage < 2 else { return }
            nextButton.isHidden = false
            skipButton.isHidden = false
            pageControl.isHidden = false
            getStartedButton.isHidden = true
            UIView.transition(with: nextButton,
                              duration: 1, options: .transitionCrossDissolve,
                              animations: { self.nextButton.isHidden = false })
            UIView.transition(with: skipButton,
                              duration: 1, options: .transitionCrossDissolve,
                              animations: { self.skipButton.isHidden = false })
            UIView.transition(with: pageControl,
                              duration: 1, options: .transitionCrossDissolve,
                              animations: { self.pageControl.isHidden = false })
            UIView.transition(with: getStartedButton,
                              duration: 1, options: .transitionCrossDissolve,
                              animations: { self.getStartedButton.isHidden = true })
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            hiddenButtons()
            return pages.first
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        pageControl.currentPage = currentIndex
    }
    
}
