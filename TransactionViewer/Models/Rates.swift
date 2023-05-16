//
//  Rates.swift
//  TransactionViewer
//
//  Created by Sergio Veliz on 16.05.2023.
//

import Foundation

struct Rate: Decodable, Equatable {
    let from: String
    let to: String
    let rate: String
}
