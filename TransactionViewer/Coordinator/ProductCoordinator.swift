//
//  ProductCoordinator.swift
//  TransactionViewer
//
//  Created by Sergio Veliz on 16.05.2023.
//

import UIKit.UINavigationController

final class ProductCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let productViewModel = ProductViewModel()
        productViewModel.coordinator = self
        
        let productVC = ProductViewController(viewModel: productViewModel)
        
        navigationController.setViewControllers([productVC], animated: false)
    }
    
    func onSelect(_ transactions: [Transaction]) {
        let transactionViewModel = TransactionViewModel(transactions: transactions)
        
        let transactionCoordinator = TransactionsCoordinator(navigationController: navigationController, transactionViewModel: transactionViewModel)
        
        transactionCoordinator.parentCoordinator = self
        childCoordinators.append(transactionCoordinator)
        transactionCoordinator.start()
    }
    
}
