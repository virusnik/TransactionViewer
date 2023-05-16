//
//  TransactionViewModel.swift
//  TransactionViewer
//
//  Created by Sergio Veliz on 16.05.2023.
//

import Foundation

protocol TransactionViewModelDelegate: AnyObject {
    func reloadData()
}

class TransactionViewModel {
    
    weak var delegate: TransactionViewModelDelegate?
    
    var transactions: [Transaction] = [Transaction]()
    private let dataService = DataLoader()
    
    init(transactions: [Transaction]) {
        self.transactions = transactions
    }
    
    func getRates() {
        dataService.getAllRates { [weak self] rates in
            print(rates)
        }
    }
    
    func getNumberOfRowsInSection() -> Int {
        return transactions.count
    }
}
