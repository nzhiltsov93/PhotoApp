import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBarController()
        setupTabBarViewControllers()
    }
    
    // MARK: - Setup
    
    private func setupTabBarController() {
        tabBar.tintColor = .systemBlue
    }

    private func setupTabBarViewControllers() {
        let mediaNavigationController = UINavigationController(rootViewController: MediaViewController())
        let mediaViewController = mediaNavigationController
        let mediaViewControllerImage = UITabBarItem(title: "Медиатека",
                                       image: UIImage(systemName: "photo.on.rectangle"),
                                       selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
        mediaViewController.tabBarItem = mediaViewControllerImage
        
        let favoriteNavigationController = UINavigationController(rootViewController: FavoriteViewController())
        let favoriteViewController = favoriteNavigationController
        let favoriteViewControllerImage = UITabBarItem(title: "Для Вас",
                                       image: UIImage(systemName: "heart.text.square"),
                                       selectedImage: UIImage(systemName: "heart.text.square.fill"))
        favoriteViewController.tabBarItem = favoriteViewControllerImage
        
        let albumsNavigationController = UINavigationController(rootViewController: AlbumsViewController())
        let albumsViewController = albumsNavigationController
        let albumsViewControllerImage = UITabBarItem(title: "Альбомы",
                                       image: UIImage(systemName: "folder"),
                                       selectedImage: UIImage(systemName: "folder.fill"))
        albumsViewController.tabBarItem = albumsViewControllerImage
        
        let searchNavigationController = UINavigationController(rootViewController: SearchViewController())
        let searchViewController = searchNavigationController
        let searchViewControllerImage = UITabBarItem(title: "Поиск",
                                       image: UIImage(systemName: "magnifyingglass"),
                                       selectedImage: UIImage(systemName: "magnifyingglass"))
        searchViewController.tabBarItem = searchViewControllerImage
        
        let controllers = [mediaViewController, favoriteViewController, albumsViewController, searchViewController]
        self.setViewControllers(controllers, animated: true)
        
    }

}

