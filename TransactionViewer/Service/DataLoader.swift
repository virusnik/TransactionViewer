//
//  DataLoader.swift
//  TransactionViewer
//
//  Created by Sergio Veliz on 16.05.2023.
//

import Foundation

class DataLoader {
    
    func getAllTransaction(completion: @escaping ([Transaction]) -> ()) {
        DispatchQueue.main.async {
            if let path = Bundle.main.path(forResource: "transactions", ofType: "plist"),
               let data = FileManager.default.contents(atPath: path) {
                let decoder = PropertyListDecoder()
                do {
                    let transaction = try decoder.decode([Transaction].self, from: data)
                    completion(transaction)
                } catch {
                    print("Error decoding rates plist: \(error)")
                }
            } else {
                print("Error path getAllTransaction plist")
            }
        }
    }
    
    private func getAllRates(completion: @escaping ([Rate]) -> ()) {
        if let path = Bundle.main.path(forResource: "rates", ofType: "plist"),
           let data = FileManager.default.contents(atPath: path) {
            let decoder = PropertyListDecoder()
            do {
                let rates = try decoder.decode([Rate].self, from: data)
                completion(rates)
            } catch {
                print("Error decoding rates plist: \(error)")
            }
        } else {
            print("Error path getAllRates plist")
        }
    }
}

