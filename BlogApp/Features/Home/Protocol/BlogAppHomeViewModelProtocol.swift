//
//  BlogAppHomeViewModelProtocol.swift
//  BlogApp
//
//  Created by Leticia on 21/06/23.
//

import Foundation

protocol BlogAppHomeViewModelProtocol {
    func start()
    var delegate: BlogAppHomeViewModelDelegate? { get set }
}
