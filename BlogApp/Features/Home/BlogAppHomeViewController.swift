//
//  BlogAppHomeViewController.swift
//  BlogApp
//
//  Created by Leticia on 20/06/23.
//

import UIKit

protocol BlogAppHomeViewControllerDelegate: AnyObject {
    func didTapPost(with data: BlogObject)
    func didTapNewPostButton()
}

final class BlogAppHomeViewController: UIViewController {
    
    // MARK: - PROPERTIES
    
    weak var delegate: BlogAppHomeViewControllerDelegate?
    private let contentView: BlogAppHomeView
    private var viewModel: BlogAppHomeViewModelProtocol
    
    // MARK: - INITIALIZER
    
    init(contentView: BlogAppHomeView = BlogAppHomeView(),
         viewModel: BlogAppHomeViewModelProtocol) {
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
        viewModel.delegate = self
        contentView.delegate = self
        viewModel.start()
    }
    
    // MARK: - PUBLIC METHODS
    
    func updateBlogList(with postData: BlogObject) {
        contentView.updatePost(with: postData)
    }
}

    // MARK: - EXTENSION

extension BlogAppHomeViewController: BlogAppHomeViewDelegate {
    func didTapNewPostButton() {
        delegate?.didTapNewPostButton()
    }
    
    func didTapPost(with data: BlogObject) {
        delegate?.didTapPost(with: data)
    }
}

extension BlogAppHomeViewController: BlogAppHomeViewModelDelegate {
    func goToHomeView(with data: BlogAppHomeModel) {
        contentView.updateView(with: data.blogList)
    }
}
