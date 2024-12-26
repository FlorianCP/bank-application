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
    private let avatarView = CircularAvatarView()
    private let contentStackView = UIStackView()
    private var cancellables = Set<AnyCancellable>()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "login_background"))
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.25
        return imageView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        
        setupUI()
        setupBindings()
        
        view.layoutIfNeeded()
    }

    // MARK: - Private
    private func setupBindings() {
        // Bind avatar image
        viewModel.$avatarImage
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                self?.avatarView.image = image
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
        
        // Set view background to clear to allow background image to show
        view.backgroundColor = .clear
        
        // Add Background Image View
        setupBackgroundImageView()
        
        // Add ScrollView
        view.addSubview(scrollView)
        setupScrollView(scrollView, in: view)

        // Add Content Stack View
        scrollView.addSubview(contentStackView)
        setupContentStackView()

        // Add Avatar View
        contentStackView.addArrangedSubview(avatarView)
        setupAvatarView()
        
        // Extend edges
        edgesForExtendedLayout = .all
        extendedLayoutIncludesOpaqueBars = true
    }
    
    private func setupBackgroundImageView() {
        // Add background image view
        view.insertSubview(backgroundImageView, at: 0)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Add blur effect
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backgroundImageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundImageView.addSubview(blurEffectView)
    }
    
    private func setupScrollView(_ scrollView: UIScrollView, in view: UIView) {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        
        // Extend scroll view to the edges of the view
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Adjust content inset for large title
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .automatic
        }
    }

    private func setupAvatarView() {
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarView.heightAnchor.constraint(equalToConstant: viewModel.avatarWidth),
            avatarView.centerXAnchor.constraint(equalTo: contentStackView.centerXAnchor)
        ])
    }

    private func setupContentStackView() {
        contentStackView.axis = .vertical
        contentStackView.spacing = 24
        contentStackView.alignment = .fill
        contentStackView.distribution = .fill
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = scrollView.contentLayoutGuide
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -16),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -32)
        ])
    }

    private func setupSections(_ sections: [PersonalSection]) {
        // Remove existing section views
        contentStackView.arrangedSubviews
            .filter { $0 != avatarView }
            .forEach { $0.removeFromSuperview() }
        
        // Add new section views
        sections.forEach { section in
            let card = Card(
                title: section.title,
                subtitle: "",  // Empty subtitle for sections
                description: section.content,
                smallText: "",  // Empty small text for sections
                identifier: section.title  // Using title as identifier
            )
            
            let cardView = UICardView(card: card)
            contentStackView.addArrangedSubview(cardView)
            
            // Add spacing between cards
            NSLayoutConstraint.activate([
                cardView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
                cardView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor)
            ])
        }
    }
}

struct PersonalDetailsViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PersonalDetailsViewController {
        let vc = PersonalDetailsViewController()
        vc.edgesForExtendedLayout = .all
        vc.extendedLayoutIncludesOpaqueBars = true
        return vc
    }
    
    func updateUIViewController(_ uiViewController: PersonalDetailsViewController, context: Context) {}
}

#Preview(traits: .sizeThatFitsLayout, body: {
    let navigationController = UINavigationController(rootViewController: UIViewController())
    navigationController.pushViewController(PersonalDetailsViewController(), animated: false)
    return navigationController
})
