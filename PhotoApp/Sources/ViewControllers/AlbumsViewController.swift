import UIKit
import SnapKit

class AlbumsViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FirstAndSecondSectionCell.self, forCellWithReuseIdentifier: FirstAndSecondSectionCell.identifier)
        collectionView.register(TableSectionCell.self, forCellWithReuseIdentifier: TableSectionCell.identifier)
        collectionView.register(AlbumsHeaderCell.self, forCellWithReuseIdentifier: AlbumsHeaderCell.identifier)
        return collectionView
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Альбомы"
        setupHierarchy()
        setupLayout()
        setupNavigationBar()
    }
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarchy() {
        view.addSubview(photoCollectionView)
    }

    private func setupLayout() {
        photoCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.bottom.equalTo(view)
            make.bottom.equalTo(view)
        }
    }
    
}
