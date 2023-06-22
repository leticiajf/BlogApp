//
//  BlogAppDetailViewController.swift
//  BlogApp
//
//  Created by Leticia on 21/06/23.
//

import UIKit

protocol BlogAppDetailViewControllerDelegate: AnyObject {
    func didTapBackButton()
}

final class BlogAppDetailViewController: UIViewController {
    
    // MARK: - PROPERTIES
    
    weak var delegate: BlogAppDetailViewControllerDelegate?
    private let contentView: BlogAppDetailView
    private let postData: BlogObject
    
    // MARK: - INITIALIZER
    
    init(postData: BlogObject,
         contentView: BlogAppDetailView = BlogAppDetailView()) {
        self.postData = postData
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = "Blog APP"
        view = contentView
        contentView.delegate = self
        contentView.updateView(with: postData)
    }
}

// MARK: - EXTENSION

extension BlogAppDetailViewController: BlogAppDetailViewDelegate {
    func didTapBackButton() {
        delegate?.didTapBackButton()
    }
}
