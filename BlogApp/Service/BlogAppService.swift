//
//  BlogAppService.swift
//  BlogApp
//
//  Created by Leticia on 21/06/23.
//

import Foundation

class BlogAppService: BlogAppServiceProtocol {
    
    private var serverData: BlogAppHomeModel = MockData.model
    
    func execute<T: Decodable>(request: BlogAppRequestProtocol,
                               completion: @escaping (Result<T, Error>) -> Void) {
        switch request.method {
            case .get:
                if let response = serverData as? T {
                    completion(.success(response))
                } else {
                    completion(.failure(NSError()))
                }
                
            case .post:
                guard let params = request.parameters else { return }
                serverData.blogList.append(params)
                if let response = serverData as? T {
                    completion(.success(response))
                } else {
                    completion(.failure(NSError()))
                }
        }
    }
}
