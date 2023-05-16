//
//  Transactions.swift
//  TransactionViewer
//
//  Created by Sergio Veliz on 16.05.2023.
//


struct Transaction: Decodable, Hashable {
    var amount: String
    var currency: String
    var sku: String
}
