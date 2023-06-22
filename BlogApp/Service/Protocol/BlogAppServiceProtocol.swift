//
//  BlogAppServiceProtocol.swift
//  BlogApp
//
//  Created by Leticia on 21/06/23.
//

import Foundation

protocol BlogAppServiceProtocol {
    func execute<T: Decodable>(request: BlogAppRequestProtocol,
                               completion: @escaping (Result<T, Error>) -> Void)
}
