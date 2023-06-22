//
//  BlogAppMock.swift
//  BlogApp
//
//  Created by Leticia on 21/06/23.
//

import Foundation

struct MockData {
    
    static let model = BlogAppHomeModel(blogList: mockList)
    
    static private let mockList: [BlogObject] = [
        BlogObject(title: "Tela Inicial",
                   description: "A tela inicial contém a lista de Posts com seus respectivos títulos e datas. Nela contém os posts mockados e é possível adicionar novos posts. Após adição de um novo post, ele aparecerá na lista de posts também!",
                   date: "20/06/23"),
        
        BlogObject(title: "Sobre Clique no Post",
                   description: "Ao clicar encima de um determinado post, você será direcionado para essa tela, de detalhes do post. Com titulo, descrição e data do post. No botão de voltar você retorna para a tela inicial do Blog",
                   date: "20/06/23"),
        
        BlogObject(title: "Sobre Adição de Novo Post",
                   description: "Ao clicar no botão adicionar Novo Post, você será direcionado para a tela de novo Post, onde terá o campo de titulo e descrição para seu post. Você só conseguirá clicar no botão de Adicionar Post se tiver preenchido os dois campos!",
                   date: "20/06/23")
    ]
}
