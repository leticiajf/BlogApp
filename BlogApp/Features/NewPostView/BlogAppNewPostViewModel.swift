//
//  BlogAppNewPostViewModel.swift
//  BlogApp
//
//  Created by Leticia on 21/06/23.
//

import Foundation

protocol BlogAppNewPostViewModelDelegate: AnyObject {
    func goToHomeView(with data: BlogAppHomeModel)
}

final class BlogAppNewPostViewModel: BlogAppNewPostViewModelProtocol {
    
    // MARK: - PROPERTIES
    
    private let service: BlogAppServiceProtocol
    weak var delegate: BlogAppNewPostViewModelDelegate?
    
    // MARK: - INITIALIZER
    
    init(service: BlogAppServiceProtocol) {
        self.service = service
    }
    
    // MARK: - API METHODS
    
    private func sendNewPostData(with data: BlogObject) {
        service.execute(request: BlogAppRequest.newPost(postData: data)) { [weak self] (result: Result<BlogAppHomeModel, Error>) in
            guard let self = self else { return }
            switch result {
                case .success(let data):
                    delegate?.goToHomeView(with: data)
                case .failure:
                    print("Erro na requisição")
            }
        }
    }
}
