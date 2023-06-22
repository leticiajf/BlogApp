//
//  BlogAppRequest.swift
//  BlogApp
//
//  Created by Leticia on 21/06/23.
//

import Foundation

enum BlogAppRequest: BlogAppRequestProtocol {
    
    case home
    case newPost(postData: BlogObject)
    
    var method: HTTPMethod {
        switch self {
            case .home: return .get
            case .newPost: return .post
        }
    }
    
    var parameters: BlogObject? {
        switch self {
            case .newPost(let postData):
                return postData
            default: return nil
        }
    }
}
