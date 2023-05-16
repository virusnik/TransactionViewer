//
//  ProductViewModel.swift
//  TransactionViewer
//
//  Created by Sergio Veliz on 16.05.2023.
//

import Foundation

protocol ProductViewModelDelegate: AnyObject {
    func reloadData()
}

class ProductViewModel {
    
    private let configure = DataLoader()
    private var products: [Product] = [Product]()
    
    weak var delegate: ProductViewModelDelegate?
    
    init() {}
    
    func getProducts() {
        getTransactions()
    }
    
    func getTransactions() {
        configure.getAllTransaction(completion: {[weak self] transactions in
            self?.getProducts(transactions: transactions)
        })
    }
    
    func getProducts(transactions: [Transaction])  {
        let groupedTransactions = Dictionary(grouping: transactions, by: { $0.sku })
        for (sku, transactions) in groupedTransactions {
            let product = Product(name: sku, transactions: transactions)
            products.append(product)
        }
        self.delegate?.reloadData()
    }
    
    func getNumberOfRowsInSection() -> Int {
        return products.count
    }
    
    func getProduct(at index: Int) -> Product? {
        guard index < products.count else { return nil }
        return products[index]
    }
    
    func didSelectProduct(at index: Int) {
//        TODO: add transition
    }
}
