import UIKit
import SnapKit

class TableSectionCell: UICollectionViewCell {

    static let identifier = "TableSectionCell"

    // MARK: - Outlets

    private lazy var symbol: UIImageView = {
        let symbol = UIImageView()
        symbol.tintColor = .systemBlue
        return symbol
    }()

    private lazy var typeMediaTitle: UILabel = {
        let typeMediaTitle = UILabel()
        typeMediaTitle.textColor = .systemBlue
        typeMediaTitle.font = UIFont.systemFont(ofSize: 18)
        return typeMediaTitle
    }()

    lazy var countTitle: UILabel = {
        let countTitle = UILabel()
        countTitle.textAlignment = .right
        countTitle.textColor = .gray
        return countTitle
    }()

    private lazy var detailSymbol: UIImageView = {
        let detailSymbol = UIImageView(image: UIImage(systemName: "chevron.right"))
        detailSymbol.tintColor = .gray
        return detailSymbol
    }()

    lazy var bottomView: UIView = {
        let view = UIView()
        return view
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
        contentView.addSubview(symbol)
        contentView.addSubview(typeMediaTitle)
        contentView.addSubview(countTitle)
        contentView.addSubview(detailSymbol)
        contentView.addSubview(bottomView)
    }

    func setupLayouts() {
        symbol.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.left.equalTo(self)
        }

        typeMediaTitle.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(contentView.snp.left).offset(30)
        }

        countTitle.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(contentView.snp.right).offset(-35)
        }

        detailSymbol.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(countTitle.snp.right).offset(10)
        }

        bottomView.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.height.equalTo(1)
            make.width.equalTo(contentView).offset(20)
        }
    }

    // MARK: - Configuration

    func configure(albums: Albums) {
        self.typeMediaTitle.text = albums.title
        self.symbol.image = UIImage(systemName: albums.image)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        typeMediaTitle.text = nil
        symbol.image = nil
    }
}
