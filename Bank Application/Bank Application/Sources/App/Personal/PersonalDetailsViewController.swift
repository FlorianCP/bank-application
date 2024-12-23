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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Add ScrollView
        view.addSubview(scrollView)
        setupScrollView(scrollView, in: view)

        // Add Content Stack View
        scrollView.addSubview(contentStackView)
        setupContentStackView()

        // Add Avatar View
        contentStackView.addArrangedSubview(avatarView)
        setupAvatarView()
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

    private func setupAvatarView() {
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarView.widthAnchor.constraint(equalToConstant: viewModel.avatarWidth),
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
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
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
        return PersonalDetailsViewController()
    }
    
    func updateUIViewController(_ uiViewController: PersonalDetailsViewController, context: Context) {}
}

#Preview(traits: .sizeThatFitsLayout, body: {
    return PersonalDetailsViewController()
})
