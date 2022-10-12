//
//  RestoreWKView.swift
//  AppStoreHW
//
//  Created by Александр Андреевич Щепелин on 10.10.2022.
//

import UIKit
import WebKit

/// Экран веб страницы
final class RestoreWKViewController: UIViewController {
    
    // MARK: - Enum
    private enum Constants {
        static let pdfName = "priceList"
        static let pdfFormat = "pdf"
    }
    
    // MARK: - Visual components
    
   private let backButtonItem = UIBarButtonItem(systemItem: .rewind)
   private let forwardButtonItem = UIBarButtonItem(systemItem: .fastForward)
   private let spacer = UIBarButtonItem(systemItem: .flexibleSpace)
   private let refreshButtonItem = UIBarButtonItem(systemItem: .refresh)
   private let loadPdfButtonItem = UIBarButtonItem(image: UIImage(
    systemName: Images.docBadgePlusName),
                                            style: .done,
                                            target: nil,
                                            action: #selector(loadPdfAction))
    private let shareButtonItem = UIBarButtonItem(image: UIImage(systemName: Images.shareImageName),
                                          style: .done,
                                          target: nil,
                                          action: #selector(presentShareSheetAction))
    
    // MARK: - Public properties
    
    var productURL = ""
    
    // MARK: - Private properties
    private var webView = WKWebView()
    private let toolBar = UIToolbar()
    private var observer: NSKeyValueObservation?
    private let progressView = UIProgressView()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        loadPageAction()
        toolBarItems()
        progressView.frame = CGRect(x: 110, y: 755, width: 140, height: 30)
        view.addSubview(progressView)
        observer = webView.observe(\.estimatedProgress, options: [.new]) { [self] _, _ in
               self.progressView.progress = Float(self.webView.estimatedProgress)
            if progressView.progress == 1.0 {
                progressView.isHidden = true
            }
           }
    }
    
    private func loadPageAction() {
        if let restoreUrl = URL(string: productURL) {
            let request = URLRequest(url: restoreUrl)
            view = webView
            webView.load(request)
        }
    }
    
    private func toolBarItems() {
        toolBar.frame = CGRect(x: 0, y: 750, width: 390, height: 30)
        toolBar.items = [backButtonItem, forwardButtonItem,
                         spacer,
                         refreshButtonItem,
                         shareButtonItem,
                         loadPdfButtonItem]
        toolBar.isTranslucent = false
        toolBar.backgroundColor = .systemBackground
        view.addSubview(toolBar)
        backButtonItem.action = #selector(backAction)
        forwardButtonItem.action = #selector(forwardAction)
        refreshButtonItem.action = #selector(refreshAction)
    }
    
    @objc private func loadPdfAction() {
        guard let url = Bundle.main.url(forResource: Constants.pdfName,
                                        withExtension: Constants.pdfFormat) else { return }
        let urlRequest = URLRequest(url: url)
        
        webView.load(urlRequest)
    }
    
    @objc private func backAction() {
        guard webView.canGoBack else { return }
        webView.goBack()
    }
    
    @objc private func forwardAction() {
        guard webView.canGoForward else { return }
        webView.goForward()
    }
    
    @objc private func refreshAction() {
        webView.reload()
    }
    
    @objc private func presentShareSheetAction() {
        guard let url = webView.url else { return }
        let shareSheetVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        present(shareSheetVC, animated: true)
    }
}
