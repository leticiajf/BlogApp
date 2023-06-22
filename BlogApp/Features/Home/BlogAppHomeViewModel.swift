//
//  BlogAppHomeViewModel.swift
//  BlogApp
//
//  Created by Leticia on 21/06/23.
//

import Foundation

protocol BlogAppHomeViewModelDelegate: AnyObject {
    func goToHomeView(with data: BlogAppHomeModel)
}

final class BlogAppHomeViewModel: BlogAppHomeViewModelProtocol {
    
    // MARK: - PROPERTIES
    
    private let service: BlogAppServiceProtocol 
    weak var delegate: BlogAppHomeViewModelDelegate?
    
    // MARK: - INITIALIZER
    
    init(service: BlogAppServiceProtocol) {
        self.service = service
    }
    
    // MARK: - PUBLIC METHODS
    
    func start() {
        fetchHomeData()
    }
    
    // MARK: - API METHODS
    
    private func fetchHomeData() {
        service.execute(request: BlogAppRequest.home) { [weak self] (result: Result<BlogAppHomeModel, Error>) in
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
