import UIKit

class FavoriteViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Для Вас"
        setupNavigationBar()
    }
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
