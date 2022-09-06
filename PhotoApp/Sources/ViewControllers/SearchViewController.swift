import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var searchField: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "Поиск"
        return search
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Поиск"
        setupNavigationBar()
    }
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchField
    }
    
}
