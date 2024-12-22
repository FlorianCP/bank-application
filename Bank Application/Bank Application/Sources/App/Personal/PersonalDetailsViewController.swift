//
//  PersonalDetailsViewController.swift
//  Bank Application
//
//  Created by Florian Rath on 21.12.24.
//

import Combine
import Foundation
import SwiftUI
import UIKit

final class PersonalDetailsViewController: UIViewController {

    // MARK: - Properties
    private let viewModel = PersonalDetailsViewModel()
    private let scrollView = UIScrollView()
    private let avatarContainerView = UIView()
    private let avatarImageView = UIImageView()
    private let avatarImageShadowView = UIView()
    private let contentStackView = UIStackView()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        
        view.layoutIfNeeded()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateAvatarImageStyling()
    }

    // MARK: - Private
    
    private func updateAvatarImageStyling() {
        let radius = viewModel.calculateAvatarCornerRadius(for: avatarImageView.bounds)
        
        // Apply corner radius directly to the layer
        avatarImageView.layer.cornerRadius = radius
        avatarImageView.layer.masksToBounds = true
        
        // Create container view for shadow
        avatarImageView.clipsToBounds = true
        
        // Create a specific shadow path for better performance
        let layer = CALayer()
        let shadowPath = UIBezierPath(roundedRect: avatarImageView.bounds,
                                     cornerRadius: radius).cgPath
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.25
        layer.shadowPath = shadowPath
        avatarImageShadowView.layer.addSublayer(layer)
    }
    
    private func setupBindings() {
        // Bind avatar image
        viewModel.$avatarImage
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                self?.avatarImageView.image = image
            }
            .store(in: &cancellables)
            
        // Bind sections
        viewModel.$sections
            .receive(on: DispatchQueue.main)
            .sink { [weak self] sections in
                self?.setupSections(sections)
            }
            .store(in: &cancellables)
    }
    
    private func setupUI() {
        title = "Persönliches"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Add ScrollView
        view.addSubview(scrollView)
        setupScrollView(scrollView, in: view)

        // Add Content Stack View
        scrollView.addSubview(contentStackView)
        setupContentStackView()

        // Add Avatar Image View
        contentStackView.addArrangedSubview(avatarContainerView)
        avatarContainerView.addSubview(avatarImageShadowView)
        avatarContainerView.addSubview(avatarImageView)
        setupAvatarImageView(avatarImageView, in: avatarContainerView, shadowView: avatarImageShadowView)
    }
    
    private func setupScrollView(_ scrollView: UIScrollView, in view: UIView) {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }

    private func setupAvatarImageView(_ imageView: UIImageView, in containerView: UIView, shadowView: UIView) {
        // TODO: 2024-12-21 flr: Remove background color
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        print("Constraints: \(avatarImageView.constraints)")
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: viewModel.avatarWidth),
            avatarImageView.heightAnchor.constraint(equalToConstant: viewModel.avatarWidth),
            avatarImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            containerView.heightAnchor.constraint(equalTo: avatarImageView.heightAnchor),
            
            shadowView.topAnchor.constraint(equalTo: imageView.topAnchor),
            shadowView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
    }

    private func setupContentStackView() {
        contentStackView.axis = .vertical
        contentStackView.spacing = 24
        contentStackView.alignment = .fill
        contentStackView.distribution = .fill
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
    }

    private func createSectionTitle(_ title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }

    private func createSectionContent(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }
    
    private func setupSections(_ sections: [PersonalSection]) {
        // Remove existing section views
        contentStackView.arrangedSubviews
            .filter { $0 != avatarImageView && $0 != avatarContainerView }
            .forEach { $0.removeFromSuperview() }
        
        // Add new section views
        sections.forEach { section in
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 12
            stackView.alignment = .fill
            
            let title = createSectionTitle(section.title)
            let content = createSectionContent(section.content)
            
            stackView.addArrangedSubview(title)
            stackView.addArrangedSubview(content)
            contentStackView.addArrangedSubview(stackView)
        }
    }
}

struct PersonalDetailsViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PersonalDetailsViewController {
        return PersonalDetailsViewController()
    }
    
    func updateUIViewController(_ uiViewController: PersonalDetailsViewController, context: Context) {
        // Update the view controller if needed
    }
}

#Preview(traits: .sizeThatFitsLayout, body: {
    return PersonalDetailsViewController()
})
