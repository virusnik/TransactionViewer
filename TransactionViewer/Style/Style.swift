//
//  File.swift
//  TransactionViewer
//
//  Created by Sergio Veliz on 16.05.2023.
//

import UIKit.UIColor

enum Style {
    enum Image {}
    enum Color {}
    enum Font {}
}

extension Style.Color {
    static let backgroundColor = UIColor.systemBackground
    static let tintColorImage = UIColor.systemGroupedBackground
}
