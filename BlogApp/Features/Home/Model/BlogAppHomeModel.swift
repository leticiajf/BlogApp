//
//  BlogAppHomeModel.swift
//  BlogApp
//
//  Created by Leticia on 21/06/23.
//

import Foundation

struct BlogAppHomeModel: Decodable {
    var blogList: [BlogObject]
}

struct BlogObject: Decodable {
    let title: String
    let description: String
    let date: String
}
