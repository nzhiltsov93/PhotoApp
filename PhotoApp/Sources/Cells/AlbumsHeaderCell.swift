import UIKit
import SnapKit

class AlbumsHeaderCell: UICollectionReusableView {
    
    static let identifier = "AlbumsHeader"

    // MARK: - Outlets

    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()

    lazy var headerTitle: UILabel = {
        let headerTitle = UILabel()
        headerTitle.text = "Заголовок"
        headerTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return headerTitle
    }()

    lazy var subtitleButton: UIButton = {
        let subtitleButton = UIButton(type: .system)
        subtitleButton.setTitle("Все", for: .normal)
        subtitleButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        subtitleButton.setTitleColor(UIColor.systemBlue, for: .normal)
        return subtitleButton
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(topView)
        addSubview(headerTitle)
        addSubview(subtitleButton)
    }

    private func setupLayout() {

        topView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(1)
        }

        headerTitle.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }

        subtitleButton.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.right.equalTo(self)
        }
    }

    // MARK: - Configuration

    override func prepareForReuse() {
        super.prepareForReuse()
        headerTitle.text = nil
        subtitleButton.setTitle(nil, for: .normal)
    }
}
