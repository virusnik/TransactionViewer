//
//  TransactionCell.swift
//  TransactionViewer
//
//  Created by Sergio Veliz on 16.05.2023.
//

import UIKit.UITableViewCell

class TransactionCell: UITableViewCell {
    
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
    
    func configure(with item: Transaction, rates: [Rate]) {
        guard let itemAsDouble = Double(item.amount) else { return }
        titleLabel.text = "\(itemAsDouble.formatted(.currency(code: item.currency)))"
        descriptionLabel.text = getDescription(amount: itemAsDouble, currency: item.currency, rates: rates)
    }
    
    func getDescription(amount: Double, currency: String, rates: [Rate]) -> String {
        if currency == Constants.baseCurrency {
            return  "\((amount * 1).formatted(.currency(code: Constants.baseCurrency)))"
        }
        guard let rateAsDouble = Double(rates.first(where: { $0.from == currency })?.rate ?? "") else { return "" }
        return "\((amount * rateAsDouble).formatted(.currency(code: Constants.baseCurrency)))"
    }
    
}
