//  Created by Александр Андреевич Щепелин on 06.10.2022.
//

import UIKit

/// Экран корзины
final class BasketViewController: UIViewController {
    
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViewWillAppear()
    }
    // MARK: - Private methods
    
    private func setupViewWillAppear() {
        overrideUserInterfaceStyle = .dark
        tabBarController?.overrideUserInterfaceStyle = .dark
    }
    
    private func setupUI() {
       view.backgroundColor = .systemBackground
    }
}
