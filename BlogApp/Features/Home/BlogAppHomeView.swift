//
//  BlogAppHomeView.swift
//  BlogApp
//
//  Created by Leticia on 20/06/23.
//

import UIKit

protocol BlogAppHomeViewDelegate: AnyObject {
    func didTapPost(with data: BlogObject)
    func didTapNewPostButton()
}

final class BlogAppHomeView: UIView {
    
    // MARK: - PROPERTIES
    
    weak var delegate: BlogAppHomeViewDelegate?
    private var blogList: [BlogObject] = []
    
    // MARK: - INITIALIZER
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .purple
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private lazy var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 20, weight: .bold)
        title.text = " Lista de Posts"
        title.textColor = .white
        return title
    }()
    
    private lazy var postTableView: UITableView = {
        let postTableView = UITableView()
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        postTableView.register(BlogAppHomeTableViewCell.self,
                                forCellReuseIdentifier: BlogAppHomeTableViewCell.identifier)
        postTableView.showsVerticalScrollIndicator = false
        postTableView.layer.cornerRadius = 8
        postTableView.separatorColor = .clear
        postTableView.backgroundColor = .clear
        postTableView.dataSource = self
        postTableView.delegate = self
        return postTableView
    }()
    
    private lazy var newPostButton: UIButton = {
        let newPostButton = UIButton(frame: .zero)
        newPostButton.translatesAutoresizingMaskIntoConstraints = false
        newPostButton.layer.cornerRadius = 8
        newPostButton.setTitle("Adicionar Novo Post", for: .normal)
        newPostButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        newPostButton.backgroundColor = .systemPink
        newPostButton.addTarget(self, action: #selector(didTapNewPostButton), for: .touchUpInside)
        return newPostButton
    }()
    
    // MARK: - PRIVATE METHODS
    
    @objc private func didTapNewPostButton() {
        delegate?.didTapNewPostButton()
    }
    
    // MARK: - PUBLIC METHODS
    
    func updateView(with data: [BlogObject]) {
        blogList.append(contentsOf: data)
        postTableView.reloadData()
    }
    
    func updatePost(with postData: BlogObject) {
        blogList.append(postData)
        postTableView.reloadData()
    }
    
    // MARK: - SETUP VIEW
    
    private func setupView() {
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(title)
        addSubview(postTableView)
        addSubview(newPostButton)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            postTableView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            postTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            postTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            newPostButton.topAnchor.constraint(equalTo: postTableView.bottomAnchor, constant: 16),
            newPostButton.heightAnchor.constraint(equalToConstant: 60),
            newPostButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            newPostButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            newPostButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - EXTENSION

extension BlogAppHomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BlogAppHomeTableViewCell.identifier, for: indexPath)
        guard let productCell = cell as? BlogAppHomeTableViewCell else { return cell }
        productCell.updateCell(with: blogList[indexPath.row])
        return productCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let blogData = blogList[indexPath.row]
        delegate?.didTapPost(with: blogData)
    }
}
