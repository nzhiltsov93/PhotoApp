import UIKit

class AlbumsViewController: UIViewController {
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Альбомы"
        setupNavigationBar()
    }
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
