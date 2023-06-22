//
//  BlogAppFlowController.swift
//  BlogApp
//
//  Created by Leticia on 20/06/23.
//

import UIKit

final class BlogAppFlowController: CustomNavigationController {
    
    // MARK: - PROPERTIES
    
    private let service: BlogAppServiceProtocol = BlogAppService()

    // MARK: - INITIALIZERS
    
    init() {
        let viewModel = BlogAppHomeViewModel(service: service)
        let rootVC = BlogAppHomeViewController(viewModel: viewModel)
        super.init(rootViewController: rootVC)
        rootVC.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - MAKE CONTROLLERS
    
    private func makeDetailViewController(with data: BlogObject) -> BlogAppDetailViewController {
        let viewController = BlogAppDetailViewController(postData: data)
        viewController.delegate = self
        return viewController
    }
    
    private func makeNewPostViewController() -> BlogAppNewPostViewController {
        let viewModel = BlogAppNewPostViewModel(service: service)
        let viewController = BlogAppNewPostViewController(viewModel: viewModel)
        viewController.delegate = self
        return viewController
    }
}

    // MARK: - EXTENSION

extension BlogAppFlowController: BlogAppHomeViewControllerDelegate {
    func didTapNewPostButton() {
        let viewController = makeNewPostViewController()
        pushViewController(viewController, animated: true)
    }
    
    func didTapPost(with data: BlogObject) {
        let viewController = makeDetailViewController(with: data)
        pushViewController(viewController, animated: true)
    }
}

extension BlogAppFlowController: BlogAppDetailViewControllerDelegate {
    func didTapBackButton() {
        popViewController(animated: true)
    }
}

extension BlogAppFlowController: BlogAppNewPostViewControllerDelegate {
    func didTapNewPost(with data: BlogObject) {
        popViewController(animated: true)
        guard let home = viewControllers.first as? BlogAppHomeViewController else { return }
        home.updateBlogList(with: data)
    }
}
