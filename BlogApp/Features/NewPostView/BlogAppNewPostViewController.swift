//
//  BlogAppNewPostViewController.swift
//  BlogApp
//
//  Created by Leticia on 21/06/23.
//

import UIKit

protocol BlogAppNewPostViewControllerDelegate: AnyObject {
    func didTapNewPost(with data: BlogObject)
}

final class BlogAppNewPostViewController: UIViewController {

    // MARK: - PROPERTIES
    weak var delegate: BlogAppNewPostViewControllerDelegate?
    private let contentView: BlogAppNewPostView
    private var viewModel: BlogAppNewPostViewModelProtocol
    
    // MARK: - INITIALIZER
    
    init(contentView: BlogAppNewPostView = BlogAppNewPostView(),
         viewModel: BlogAppNewPostViewModelProtocol) {
        self.viewModel = viewModel
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Blog APP"
        view = contentView
        contentView.delegate = self
    }
}

// MARK: - EXTENSION

extension BlogAppNewPostViewController: BlogAppNewPostViewDelegate {
    func didTapAddButton(with data: BlogObject) {
        delegate?.didTapNewPost(with: data)
    }
}
