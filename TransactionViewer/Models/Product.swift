//
//  Product.swift
//  TransactionViewer
//
//  Created by Sergio Veliz on 16.05.2023.
//

import Foundation

struct Product {
    var name: String
    var transactions: [Transaction]
    
    init(name: String, transactions: [Transaction]) {
        self.name = name
        self.transactions = transactions
    }
}
