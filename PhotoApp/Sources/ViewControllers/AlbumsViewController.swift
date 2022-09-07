import UIKit
import SnapKit

class AlbumsViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FirstAndSecondSectionCell.self, forCellWithReuseIdentifier: FirstAndSecondSectionCell.identifier)
        collectionView.register(TableSectionCell.self, forCellWithReuseIdentifier: TableSectionCell.identifier)
        collectionView.register(AlbumsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AlbumsHeaderCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
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

// MARK: - Extension

extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Albums.albums.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Albums.albums[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstAndSecondSectionCell.identifier, for: indexPath) as! FirstAndSecondSectionCell
            cell.configureAlbumsDetails(albums: Albums.albums[indexPath.section][indexPath.item])
            if indexPath.item == 0 {
                cell.countTitle.text = "438"
            } else {
                cell.countTitle.text = String(Int.random(in: 5...50))
            }
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstAndSecondSectionCell.identifier, for: indexPath) as! FirstAndSecondSectionCell
            cell.configureAlbumsDetails(albums: Albums.albums[indexPath.section][indexPath.item])
            return cell
        case 2, 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableSectionCell.identifier, for: indexPath) as! TableSectionCell
            cell.configure(albums: Albums.albums[indexPath.section][indexPath.item])
            cell.countTitle.text = String(Int.random(in: 20...40))
            if (indexPath.section == 2 && indexPath.item == 6) || (indexPath.section == 3 && indexPath.item == 2) {
                cell.bottomView.backgroundColor = UIColor.clear
            } else {
                cell.bottomView.backgroundColor = UIColor.systemGray5
            }
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .systemGreen
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumsHeaderCell.identifier, for: indexPath) as! AlbumsHeaderCell
            header.headerTitle.text = "Мои альбомы"
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumsHeaderCell.identifier, for: indexPath) as! AlbumsHeaderCell
            header.headerTitle.text = "Люди и места"
            header.subtitleButton.isHidden = true
            return header
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumsHeaderCell.identifier, for: indexPath) as! AlbumsHeaderCell
            header.headerTitle.text = "Типы медиафайлов"
            header.subtitleButton.isHidden = true
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumsHeaderCell.identifier, for: indexPath) as! AlbumsHeaderCell
            header.headerTitle.text = "Другое"
            header.subtitleButton.isHidden = true
            return header
        }
    
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Выбрана ячейка - \(Albums.albums[indexPath.section][indexPath.item].title)")
    }
    
}
