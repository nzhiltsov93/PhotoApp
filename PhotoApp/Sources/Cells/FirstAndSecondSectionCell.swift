import UIKit
import SnapKit

class FirstAndSecondSectionCell: UICollectionViewCell {
    
    static let identifier = "FirstAndSecondSectionCell"

    // MARK: - Outlets
    
    private lazy var albumTitle: UILabel = {
        let albumTitle = UILabel()
        albumTitle.textColor = .black
        return albumTitle
    }()

    lazy var countTitle: UILabel = {
        let countTitle = UILabel()
        countTitle.textColor = .gray
        return countTitle
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()

    private lazy var albumsDetailsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 2
        return stackView
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setupHierarchy()
        setupLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    func setupHierarchy() {
        contentView.addSubview(imageView)
        albumsDetailsStack.addArrangedSubview(albumTitle)
        albumsDetailsStack.addArrangedSubview(countTitle)
        contentView.addSubview(albumsDetailsStack)
    }

    func setupLayouts() {
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalTo(contentView)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.75)
        }

        albumsDetailsStack.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).multipliedBy(1.05)
        }
    }

    // MARK: - Configuration

    func configureAlbumsDetails(albums: Albums) {
        self.albumTitle.text = albums.title
        self.imageView.image = UIImage(named: albums.image)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        albumTitle.text = nil
        countTitle.text = nil
        imageView.image = nil
    }
    
}
