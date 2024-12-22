//
//  CircularAvatarView.swift
//  Bank Application
//
//  Created by AI on 22.12.24.
//

import UIKit

final class CircularAvatarView: UIView {
    // MARK: - Properties
    private let imageView = UIImageView()
    private let shadowView = UIView()
    
    var image: UIImage? {
        get { imageView.image }
        set { 
            imageView.image = newValue
            setNeedsLayout()
        }
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        updateStyling()
    }
    
    // MARK: - Private
    private func setupViews() {
        addSubview(shadowView)
        addSubview(imageView)
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        shadowView.clipsToBounds = false
        shadowView.backgroundColor = .white
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            shadowView.topAnchor.constraint(equalTo: imageView.topAnchor),
            shadowView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
    }
    
    private func updateStyling() {
        let radius = min(bounds.width, bounds.height) / 2
        
        // Apply corner radius to image view
        imageView.layer.cornerRadius = radius
        imageView.layer.masksToBounds = true
        
        // Update shadow
        shadowView.layer.cornerRadius = radius
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 8)
        shadowView.layer.shadowRadius = 8
        shadowView.layer.shadowOpacity = 0.25
    }
} 

#Preview(traits: .fixedLayout(width: 300, height: 200)) {
    let view = CircularAvatarView()
    view.backgroundColor = .lightGray
    view.image = UIImage(named: "profile_pic")
    return view
}
