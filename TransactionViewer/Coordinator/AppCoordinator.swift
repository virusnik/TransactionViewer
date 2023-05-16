//
//  AppCoordinator.swift
//  TransactionViewer
//
//  Created by Sergio Veliz on 16.05.2023.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        navigationController.view.backgroundColor = Style.Color.backgroundColor
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let searchListCoordinator = ProductCoordinator(navigationController: navigationController)
        
        childCoordinators.append(searchListCoordinator)
        searchListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}







    
