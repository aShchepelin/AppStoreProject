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
    // MARK: - Private methods
    private func setupUI() {
       view.backgroundColor = .systemBackground
    }
}
