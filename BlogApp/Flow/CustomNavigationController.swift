//
//  CustomNavigationController.swift
//  BlogApp
//
//  Created by Leticia on 21/06/23.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        configureNavBarAppearance()
        customizeNavBar()
    }
    
    private func configureNavBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemPink
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
    }
    
    private func customizeNavBar() {
        navigationBar.tintColor = .white
    }
}
