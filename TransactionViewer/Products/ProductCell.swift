//
//  ProductCell.swift
//  TransactionViewer
//
//  Created by Sergio Veliz on 16.05.2023.
//

import UIKit.UITableViewCell


class ProductCell: UITableViewCell {
    
    //MARK: Subviews
    
    private lazy var labelsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        return stack
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    //MARK: Constraints
    private func setupConstraints() {
        
        addSubviewsForAutolayout([
            labelsStack
        ])
        
        NSLayoutConstraint.activate([
            labelsStack.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            labelsStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            labelsStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            labelsStack.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -8),
            
        ])
    }
    
    //MARK: Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with item: Product) {
        titleLabel.text = item.name
        descriptionLabel.text = "\(item.transactions.count) transactions"
    }
    
}
