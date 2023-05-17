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
    var rates: [Rate] = [Rate]()
    private let dataService = DataLoader()
    
    init(transactions: [Transaction]) {
        self.transactions = transactions
    }
    
    func getRates() {
        dataService.getAllRates { [weak self] rates in
            self?.rates = rates
            
            
        }
    }
    
    func getTotalSum() -> String {
        var sum:Double = 0.0
        var amount: Double = 0.0
        for item in transactions {
            if item.currency == Constants.baseCurrency {
                amount = ((Double(item.amount)! * 1))
            } else {
                guard let rateAsDouble = Double(rates.first(where: { $0.from == item.currency })?.rate ?? "") else { return "" }
                amount = Double(item.amount)! * rateAsDouble
            }
            
            sum += amount
        }
        
        return "Total: \((sum).formatted(.currency(code: Constants.baseCurrency)))"
    }
    
    func getNumberOfRowsInSection() -> Int {
        return transactions.count
    }
}
