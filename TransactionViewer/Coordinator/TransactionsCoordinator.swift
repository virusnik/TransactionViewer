//
//  TransactionsCoordinator.swift
//  TransactionViewer
//
//  Created by Sergio Veliz on 16.05.2023.
//

import UIKit.UINavigationController

final class TransactionsCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    
    private let navigationController: UINavigationController
    private var transactionViewModel: TransactionViewModel
    var parentCoordinator: ProductCoordinator?
    
    init(navigationController: UINavigationController,
         transactionViewModel: TransactionViewModel) {
        self.navigationController = navigationController
        self.transactionViewModel = transactionViewModel
    }
    
    func start() {
        let transactionVC = TransactionViewController(viewModel: transactionViewModel)
        navigationController.pushViewController(transactionVC, animated: true)
    }
    
    func popViewController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
}
