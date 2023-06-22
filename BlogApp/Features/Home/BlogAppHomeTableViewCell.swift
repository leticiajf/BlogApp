//
//  BlogAppHomeTableViewCell.swift
//  BlogApp
//
//  Created by Leticia on 20/06/23.
//

import UIKit

final class BlogAppHomeTableViewCell: UITableViewCell {
    
    // MARK: - PROPERTIES
    
    static let identifier = "BlogAppHomeTableViewCell"
    
    // MARK: - INITIALIZER
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFE CYCLE
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        datePost.text = nil
    }
    
    // MARK: - UI
    
    private lazy var title: UILabel = {
        let title = UILabel(frame: .zero)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 1
        title.font = .systemFont(ofSize: 16, weight: .bold)
        title.textColor = .black
        return title
    }()
    
    private lazy var datePost: UILabel = {
        let dataPost = UILabel(frame: .zero)
        dataPost.translatesAutoresizingMaskIntoConstraints = false
        dataPost.numberOfLines = 1
        dataPost.font = .systemFont(ofSize: 12, weight: .regular)
        dataPost.textColor = .black
        return dataPost
    }()
    
    private lazy var lineView: UIView = {
        let lineView = UILabel(frame: .zero)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .lightGray
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return lineView
    }()
    
    // MARK: - PUBLIC METHODS
    
    func updateCell(with cellData: BlogObject) {
        title.text = cellData.title
        datePost.text = cellData.date
    }
    
    // MARK: - SETUP VIEW
    
    private func setupView() {
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(title)
        contentView.addSubview(datePost)
        contentView.addSubview(lineView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            datePost.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            datePost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            datePost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            lineView.topAnchor.constraint(equalTo: datePost.bottomAnchor, constant: 12),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            lineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
