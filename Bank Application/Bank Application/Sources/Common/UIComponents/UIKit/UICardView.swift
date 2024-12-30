import UIKit

final class UICardView: UIControl {
    // MARK: - Properties
    private let card: Card
    private var action: ((String) -> Void)?
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let smallTextLabel = UILabel()
    private let chevronImageView = UIImageView()
    private let contentStackView = UIStackView()
    private let textStackView = UIStackView()
    
    // MARK: - Initialization
    init(card: Card, action: ((String) -> Void)? = nil) {
        self.card = card
        self.action = action
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupViews() {
        backgroundColor = UIColor.systemBackground
        layer.cornerRadius = 12
        
        // Add shadow
        layer.shadowColor = UIColor.label.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 5
        layer.masksToBounds = false
        
        // Disable user interaction on content views
        contentStackView.isUserInteractionEnabled = false
        textStackView.isUserInteractionEnabled = false
        titleLabel.isUserInteractionEnabled = false
        subtitleLabel.isUserInteractionEnabled = false
        descriptionLabel.isUserInteractionEnabled = false
        smallTextLabel.isUserInteractionEnabled = false
        chevronImageView.isUserInteractionEnabled = false
        
        // Setup content stack view
        contentStackView.axis = .horizontal
        contentStackView.spacing = 12
        contentStackView.alignment = .center
        addSubview(contentStackView)
        
        // Setup text stack view
        textStackView.axis = .vertical
        textStackView.spacing = 12
        contentStackView.addArrangedSubview(textStackView)
        
        // Setup labels
        titleLabel.text = card.title
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        titleLabel.textColor = .label
        textStackView.addArrangedSubview(titleLabel)
        
        subtitleLabel.text = card.subtitle
        subtitleLabel.font = .preferredFont(forTextStyle: .subheadline)
        subtitleLabel.textColor = .secondaryLabel
        textStackView.addArrangedSubview(subtitleLabel)
        
        descriptionLabel.text = card.description
        descriptionLabel.font = .preferredFont(forTextStyle: .body)
        descriptionLabel.textColor = .label
        descriptionLabel.numberOfLines = 0
        textStackView.addArrangedSubview(descriptionLabel)
        
        smallTextLabel.text = card.smallText
        smallTextLabel.font = .preferredFont(forTextStyle: .caption1)
        smallTextLabel.textColor = .secondaryLabel
        textStackView.addArrangedSubview(smallTextLabel)
        
        if action != nil {
            isUserInteractionEnabled = true
            addTarget(self, action: #selector(handleTap), for: .touchUpInside)
            
            // Setup chevron
            chevronImageView.image = UIImage(systemName: "chevron.right")
            chevronImageView.tintColor = .secondaryLabel
            chevronImageView.contentMode = .scaleAspectFit
            contentStackView.addArrangedSubview(chevronImageView)
        } else {
            isUserInteractionEnabled = false
        }
        
        // Setup constraints
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            chevronImageView.widthAnchor.constraint(equalToConstant: 14),
            chevronImageView.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    // MARK: - Touch Handling
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction]) {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.98, y: 0.98) : .identity
                self.layer.shadowOpacity = self.isHighlighted ? 0.3 : 0.1
                self.layer.shadowOffset = self.isHighlighted ? CGSize(width: 0, height: 4) : CGSize(width: 0, height: 2)
                self.layer.shadowRadius = self.isHighlighted ? 8 : 5
            }
        }
    }
    
    // MARK: - Actions
    @objc private func handleTap() {
        action?(card.identifier)
    }
}

#Preview(traits: .fixedLayout(width: 300, height: 200)) {
    let cardView = UICardView(
        card: Card(
            title: "Example Title",
            subtitle: "Example Subtitle",
            description: "This is a longer description that can span multiple lines and provide more detailed information about the card content.",
            smallText: "Additional information",
            identifier: "example"
        ),
        action: { identifier in
            print("Tapped card with identifier: \(identifier)")
        }
    )
    return cardView
} 
