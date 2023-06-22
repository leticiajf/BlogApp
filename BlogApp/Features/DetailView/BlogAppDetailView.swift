//
//  BlogAppDetailView.swift
//  BlogApp
//
//  Created by Leticia on 20/06/23.
//

import UIKit

protocol BlogAppDetailViewDelegate: AnyObject {
    func didTapBackButton()
}

final class BlogAppDetailView: UIView {
    
    // MARK: - PROPERTIES
    
    weak var delegate: BlogAppDetailViewDelegate?
    
    // MARK: - INITIALIZER
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .purple
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        return containerView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 8
        return stackView
    }()
    
    private lazy var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 20, weight: .bold)
        title.text = "Detalhes do Post"
        title.textColor = .white
        return title
    }()
    
    private lazy var titlePost: UILabel = {
        let titlePost = UILabel()
        titlePost.translatesAutoresizingMaskIntoConstraints = false
        titlePost.font = .systemFont(ofSize: 20, weight: .bold)
        titlePost.textColor = .black
        return titlePost
    }()
    
    private lazy var dataPost: UILabel = {
        let dataPost = UILabel()
        dataPost.translatesAutoresizingMaskIntoConstraints = false
        dataPost.font = .systemFont(ofSize: 14, weight: .regular)
        dataPost.textColor = .black
        return dataPost
    }()
    
    private lazy var descriptionPost: UILabel = {
        let descriptionPost = UILabel()
        descriptionPost.translatesAutoresizingMaskIntoConstraints = false
        descriptionPost.numberOfLines = 0
        descriptionPost.font = .systemFont(ofSize: 16, weight: .regular)
        descriptionPost.textColor = .black
        return descriptionPost
    }()
    
    private lazy var backButton: UIButton = {
        let backButton = UIButton(frame: .zero)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.layer.cornerRadius = 8
        backButton.setTitle("Voltar", for: .normal)
        backButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        backButton.backgroundColor = .systemPink
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return backButton
    }()
    
    // MARK: - PRIVATE METHODS
    
    @objc private func didTapBackButton() {
        delegate?.didTapBackButton()
    }
    
    // MARK: - PUBLIC METHODS
    
    func updateView(with data: BlogObject) {
        titlePost.text = data.title
        dataPost.text = data.date
        descriptionPost.text = data.description
    }
    
    // MARK: - SETUP VIEW
    
    private func setupView() {
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(title)
        addSubview(containerView)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(titlePost)
        stackView.addArrangedSubview(dataPost)
        stackView.addArrangedSubview(descriptionPost)
        addSubview(backButton)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            containerView.topAnchor.constraint(equalTo: title.topAnchor, constant: 48),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            
            backButton.heightAnchor.constraint(equalToConstant: 60),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            backButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            backButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
