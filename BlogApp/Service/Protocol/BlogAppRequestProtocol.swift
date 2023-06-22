//
//  BlogAppRequestProtocol.swift
//  BlogApp
//
//  Created by Leticia on 21/06/23.
//

import Foundation

enum HTTPMethod {
    case get
    case post
}

protocol BlogAppRequestProtocol {
    var method: HTTPMethod { get }
    var parameters: BlogObject? { get }
}
